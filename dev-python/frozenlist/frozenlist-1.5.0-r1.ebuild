# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="A list-like structure which implements collections.abc.MutableSequence"
HOMEPAGE="
  https://pypi.org/project/frozenlist/
  Chat: Matrix, https://matrix.to/#/#aio-libs:matrix.org
  Chat: Matrix Space, https://matrix.to/#/#aio-libs-space:matrix.org
  CI: Github Actions, https://github.com/aio-libs/frozenlist/actions
  Code of Conduct, https://github.com/aio-libs/.github/blob/master/CODE_OF_CONDUCT.md
  Coverage: codecov, https://codecov.io/github/aio-libs/frozenlist
  Docs: Changelog, https://github.com/aio-libs/frozenlist/blob/master/CHANGES.rst#changelog
  Docs: RTD, https://frozenlist.aio-libs.org
  GitHub: issues, https://github.com/aio-libs/frozenlist/issues
  GitHub: repo, https://github.com/aio-libs/frozenlist
"
SRC_URI="
	https://github.com/aio-libs/frozenlist/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="+native-extensions"

BDEPEND="
	dev-python/expandvars[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	native-extensions? (
		$(python_gen_cond_dep '
			dev-python/cython[${PYTHON_USEDEP}]
		' 'python*')
	)
"

distutils_enable_tests pytest

python_compile() {
	# pypy is not using the C extension
	if ! use native-extensions || [[ ${EPYTHON} != python* ]]; then
		local -x FROZENLIST_NO_EXTENSIONS=1
	fi

	distutils-r1_python_compile
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	rm -rf frozenlist || die
	epytest -o addopts=
}
