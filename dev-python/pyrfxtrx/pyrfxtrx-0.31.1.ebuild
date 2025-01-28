# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_PN="pyRFXtrx"
inherit distutils-r1 pypi

DESCRIPTION="a library to communicate with the RFXtrx family of devices"
HOMEPAGE="
  https://pypi.org/project/pyRFXtrx/
"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	>=dev-python/pyserial-2.7[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
>=dev-python/pyserial-2.7[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
