# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Yet another URL library"
HOMEPAGE="
  https://pypi.org/project/yarl/
  Chat: Matrix, https://matrix.to/#/#aio-libs:matrix.org
  Chat: Matrix Space, https://matrix.to/#/#aio-libs-space:matrix.org
  CI: GitHub Workflows, https://github.com/aio-libs/yarl/actions?query=branch:master
  Code of Conduct, https://github.com/aio-libs/.github/blob/master/CODE_OF_CONDUCT.md
  Coverage: codecov, https://codecov.io/github/aio-libs/yarl
  Docs: Changelog, https://yarl.aio-libs.org/en/latest/changes/
  Docs: RTD, https://yarl.aio-libs.org
  GitHub: issues, https://github.com/aio-libs/yarl/issues
  GitHub: repo, https://github.com/aio-libs/yarl
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="+native-extensions"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/idna-2.0[${PYTHON_USEDEP}]
	>=dev-python/multidict-4.0[${PYTHON_USEDEP}]
	>=dev-python/propcache-0.2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/idna-2.0[${PYTHON_USEDEP}]
	>=dev-python/multidict-4.0[${PYTHON_USEDEP}]
	>=dev-python/propcache-0.2.0[${PYTHON_USEDEP}]
"
BDEPEND="
	native-extensions? (
		dev-python/cython[${PYTHON_USEDEP}]
	)
	dev-python/expandvars[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_compile() {
	local -x YARL_NO_EXTENSIONS=0
	if ! use native-extensions || [[ ${EPYTHON} != python* ]]; then
		YARL_NO_EXTENSIONS=1
	fi
	distutils-r1_python_compile
}

python_test() {
	local EPYTEST_IGNORE=(
		# benchmarks
		tests/test_quoting_benchmarks.py
		tests/test_url_benchmarks.py
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local opts=()
	# note different boolean logic than for backend (sigh)
	local -x YARL_NO_EXTENSIONS=
	if ! use native-extensions || [[ ${EPYTHON} != python* ]]; then
		YARL_NO_EXTENSIONS=1
	fi

	rm -rf yarl || die
	epytest -o addopts= "${opts[@]}"
}
