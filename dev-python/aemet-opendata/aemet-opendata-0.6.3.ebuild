# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

PYPI_PN="AEMET-OpenData"
inherit distutils-r1 pypi

DESCRIPTION="AEMET OpenData Rest API library"
HOMEPAGE="
  https://pypi.org/project/AEMET-OpenData/
  Homepage, https://github.com/Noltari/AEMET-OpenData
  Bug Tracker, https://github.com/Noltari/AEMET-OpenData/issues
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	sci-geosciences/geopy[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	sci-geosciences/geopy[${PYTHON_USEDEP}]
"
