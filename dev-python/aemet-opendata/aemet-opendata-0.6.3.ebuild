# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
PYPI_PN="aemet_opendata"

inherit distutils-r1 pypi
DESCRIPTION="AEMET OpenData Rest API library"
HOMEPAGE="
  https://pypi.org/project/aemet_opendata/
  Homepage, https://github.com/Noltari/AEMET-OpenData
  Bug Tracker, https://github.com/Noltari/AEMET-OpenData/issues
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	sci-geosciences/geopy[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} 
	dev-python/aiohttp[${PYTHON_USEDEP}]
	sci-geosciences/geopy[${PYTHON_USEDEP}]
"
