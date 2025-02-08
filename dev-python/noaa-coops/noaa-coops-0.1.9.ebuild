# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python wrapper for NOAA Tides & Currents Data and Metadata"
HOMEPAGE="
  https://pypi.org/project/noaa-coops/
  Bug Tracker, https://github.com/GClunies/noaa_coops/issues
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	numpy
	pandas (>=1.1.3)
	requests
	zeep
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.1.3[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/zeep[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/zeep[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
