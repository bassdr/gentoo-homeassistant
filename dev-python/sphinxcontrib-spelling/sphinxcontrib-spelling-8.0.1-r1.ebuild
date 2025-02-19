# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinxcontrib-spelling/"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	PyEnchant>=3.1.1
	Sphinx>=3.0.0
	coverage!=4.4,>=4.0; extra == 'test'
	pytest-cov; extra == 'test'
	pytest; extra == 'test'
	requests>=2.32.3
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pyenchant-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/sphinx-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pyenchant-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/sphinx-3.0.0[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-4.0[${PYTHON_USEDEP}] !~dev-python/coverage-4.4[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	dev-python/pbr[${PYTHON_USEDEP}]
	test? (
		app-dicts/myspell-en
	)
"

distutils_enable_tests pytest

python_compile() {
	distutils-r1_python_compile
	find "${BUILD_DIR}" -name '*.pth' -delete || die
}

python_test() {
	local EPYTEST_DESELECT=(
		# requires the git repo
		tests/test_filter.py::test_contributors

		# Internet
		tests/test_filter.py::test_pypi_filter_factory
	)

	distutils_write_namespace sphinxcontrib
	rm -rf sphinxcontrib || die

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest tests
}
