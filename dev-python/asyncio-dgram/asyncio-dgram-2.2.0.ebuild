# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Higher level Datagram support for Asyncio"
HOMEPAGE="
  https://pypi.org/project/asyncio_dgram/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/black-20_beta1[${PYTHON_USEDEP}]
	>=dev-python/flake8-3.8.3[${PYTHON_USEDEP}]
	>=dev-python/mypy-0.812[${PYTHON_USEDEP}]
	>=dev-python/mypy-extensions-0.4.3[${PYTHON_USEDEP}]
	>=dev-python/pytest-5.4.3[${PYTHON_USEDEP}]
	>=dev-python/pytest-asyncio-0.14.0[${PYTHON_USEDEP}]
	>=dev-python/typed-ast-1.4.3[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.10.0.0[${PYTHON_USEDEP}]
)"
