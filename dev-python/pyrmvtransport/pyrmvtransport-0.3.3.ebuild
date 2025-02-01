# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=flit
PYPI_NO_NORMALIZE=1
PYPI_PN="PyRMVtransport"
inherit distutils-r1 pypi
DESCRIPTION="Python library to make use of transport information from opendata.rmv.de."
HOMEPAGE="
  https://pypi.org/project/PyRMVtransport/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/async-timeout-4.0.0[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/asynctest[${PYTHON_USEDEP}]
	dev-python/bandit[${PYTHON_USEDEP}]
	dev-python/black[${PYTHON_USEDEP}]
	dev-python/codecov[${PYTHON_USEDEP}]
	dev-python/coverage[${PYTHON_USEDEP}]
	dev-python/flake8[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/mypy[${PYTHON_USEDEP}]
	dev-python/pylint[${PYTHON_USEDEP}]
	>=dev-python/pytest-5.2.2[${PYTHON_USEDEP}]
	dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-2.8.1[${PYTHON_USEDEP}]
	dev-python/pytest-httpx[${PYTHON_USEDEP}]
	dev-python/pytest-mock[${PYTHON_USEDEP}]
	dev-python/tox[${PYTHON_USEDEP}]
	dev-vcs/pre-commit[${PYTHON_USEDEP}]
)"
