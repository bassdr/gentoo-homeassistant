# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="pyEGPS"
inherit distutils-r1 pypi

DESCRIPTION="Controlling Energenie Power Strips with python."
HOMEPAGE="
  https://pypi.org/project/pyEGPS/
  Homepage, https://github.com/gnumpi/pyegps
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/pyusb[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
dev-python/pyusb[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
