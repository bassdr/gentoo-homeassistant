# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="iSmartGate and GogoGate2 API"
HOMEPAGE="
  https://pypi.org/project/ismartgate/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="all setup"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	all? ( >=dev-python/black-22.12.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/bump2version-1.0.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/codecov-2.1.4[${PYTHON_USEDEP}] )
	all? ( >=dev-python/coverage-5.1[${PYTHON_USEDEP}] )
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
	all? ( >=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}] )
	>=dev-python/dicttoxml-1.7.4[${PYTHON_USEDEP}]
	all? ( >=dev-python/dicttoxml-1.7.4[${PYTHON_USEDEP}] )
	all? ( >=dev-python/flake8-3.8.3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/flake8-debugger-3.2.1[${PYTHON_USEDEP}] )
	>=dev-python/httpx-0.18.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/httpx-0.18.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/ipython-7.15.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/m2r2-0.2.7[${PYTHON_USEDEP}] )
	>=dev-python/pycryptodome-3.9.8[${PYTHON_USEDEP}]
	all? ( >=dev-python/pycryptodome-3.9.8[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-5.4.3[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-cov-2.9.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-raises-0.11[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-runner-5.2[${PYTHON_USEDEP}] )
	setup? ( >=dev-python/pytest-runner-5.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/respx-0.17.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sphinx-3.4.3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sphinx-rtd-theme-0.5.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/tox-3.15.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/twine-3.1.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/typing-extensions-3.10.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/wheel-0.34.2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/dicttoxml2[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.9.8[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.18.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/respx[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/black-22.12.0[${PYTHON_USEDEP}]
	>=dev-python/bump2version-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/codecov-2.1.4[${PYTHON_USEDEP}]
	>=dev-python/coverage-5.1[${PYTHON_USEDEP}]
	>=dev-python/flake8-3.8.3[${PYTHON_USEDEP}]
	>=dev-python/flake8-debugger-3.2.1[${PYTHON_USEDEP}]
	>=dev-python/ipython-7.15.0[${PYTHON_USEDEP}]
	>=dev-python/m2r2-0.2.7[${PYTHON_USEDEP}]
	>=dev-python/pytest-5.4.3[${PYTHON_USEDEP}]
	dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-raises-0.11[${PYTHON_USEDEP}]
	>=dev-python/pytest-runner-5.2[${PYTHON_USEDEP}]
	>=dev-python/respx-0.17.0[${PYTHON_USEDEP}]
	>=dev-python/sphinx-3.4.3[${PYTHON_USEDEP}]
	>=dev-python/sphinx-rtd-theme-0.5.1[${PYTHON_USEDEP}]
	>=dev-python/tox-3.15.2[${PYTHON_USEDEP}]
	>=dev-python/twine-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.10.0.0[${PYTHON_USEDEP}]
	>=dev-python/wheel-0.34.2[${PYTHON_USEDEP}]
)"
