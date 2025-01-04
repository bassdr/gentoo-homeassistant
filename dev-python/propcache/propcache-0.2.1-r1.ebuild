# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Accelerated property cache"
HOMEPAGE="
  https://pypi.org/project/propcache/
  Chat: Matrix, https://matrix.to/#/#aio-libs:matrix.org
  Chat: Matrix Space, https://matrix.to/#/#aio-libs-space:matrix.org
  CI: GitHub Workflows, https://github.com/aio-libs/propcache/actions?query=branch:master
  Code of Conduct, https://github.com/aio-libs/.github/blob/master/CODE_OF_CONDUCT.md
  Coverage: codecov, https://codecov.io/github/aio-libs/propcache
  Docs: Changelog, https://propcache.readthedocs.io/en/latest/changes/
  Docs: RTD, https://propcache.readthedocs.io
  GitHub: issues, https://github.com/aio-libs/propcache/issues
  GitHub: repo, https://github.com/aio-libs/propcache
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="+native-extensions"

BDEPEND="
	native-extensions? (
		dev-python/cython[${PYTHON_USEDEP}]
	)
	dev-python/expandvars[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_compile() {
	local -x PROPCACHE_NO_EXTENSIONS=0
	if ! use native-extensions || [[ ${EPYTHON} != python* ]]; then
		PROPCACHE_NO_EXTENSIONS=1
	fi
	distutils-r1_python_compile
}

python_test() {
	local EPYTEST_IGNORE=(
		tests/test_benchmarks.py
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local opts=()
	if ! use native-extensions || [[ ${EPYTHON} != python* ]]; then
		opts+=( --no-c-extensions )
	fi

	rm -rf propcache || die
	epytest -o addopts= "${opts[@]}"
}
