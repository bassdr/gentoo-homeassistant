# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python API for Ayla IoT products"
HOMEPAGE="
  https://pypi.org/project/ayla-iot-unofficial/
  Homepage, https://github.com/rewardone/ayla-iot-unofficial
  Bug Tracker, https://github.com/rewardone/ayla-iot-unofficial/issues
"

LICENSE="None"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS=""

GENERATED_DEPEND="
	dev-python/ujson[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/aiohttp-3.8.4[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
	>=dev-python/ujson-5.8.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
