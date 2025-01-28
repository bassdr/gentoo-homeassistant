# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="multidict implementation"
HOMEPAGE="
  https://pypi.org/project/multidict/
  Chat: Matrix, https://matrix.to/#/#aio-libs:matrix.org
  Chat: Matrix Space, https://matrix.to/#/#aio-libs-space:matrix.org
  CI: GitHub, https://github.com/aio-libs/multidict/actions
  Code of Conduct, https://github.com/aio-libs/.github/blob/master/CODE_OF_CONDUCT.md
  Coverage: codecov, https://codecov.io/github/aio-libs/multidict
  Docs: Changelog, https://multidict.aio-libs.org/en/latest/changes/
  Docs: RTD, https://multidict.aio-libs.org
  GitHub: issues, https://github.com/aio-libs/multidict/issues
  GitHub: repo, https://github.com/aio-libs/multidict
"
SRC_URI="
	https://github.com/aio-libs/${PN}/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="+native-extensions"

GENERATED_DEPEND="
"
RDEPEND="${GENERATED_DEPEND}
	$(python_gen_cond_dep '
		>=dev-python/typing-extensions-4.1.0[${PYTHON_USEDEP}]
	' 3.10)
"

distutils_enable_tests pytest

python_prepare_all() {
	# don't enable coverage or other pytest settings
	sed -i -e '/cov/d' pytest.ini || die
	distutils-r1_python_prepare_all
}

python_compile() {
	if ! use native-extensions || [[ ${EPYTHON} == pypy3 ]]; then
		local -x MULTIDICT_NO_EXTENSIONS=1
	fi

	distutils-r1_python_compile
}

python_test() {
	rm -rf multidict || die

	local cext=--c-extensions
	if ! use native-extensions || [[ ${EPYTHON} == pypy3 ]]; then
		cext=--no-c-extensions
	fi
	epytest "${cext}"
}
