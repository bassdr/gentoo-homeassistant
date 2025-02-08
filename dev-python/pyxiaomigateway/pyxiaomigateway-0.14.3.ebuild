# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="PyXiaomiGateway"
inherit distutils-r1 pypi

DESCRIPTION="A library to communicate with the Xiaomi Gateway"
HOMEPAGE="
  https://pypi.org/project/pyxiaomigateway/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	cryptography (>=2.1.1)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cryptography-2.1.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
>=dev-python/cryptography-2.1.1"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
