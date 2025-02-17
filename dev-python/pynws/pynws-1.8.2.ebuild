# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python library to retrieve observations and forecasts from NWS/NOAA"
HOMEPAGE="
  https://pypi.org/project/pynws/
  Repository, https://github.com/MatthewFlamm/pynws
  Bug Tracker, https://github.com/MatthewFlamm/pynws/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="retry"
IUSE="${GENERATED_IUSE} +retry"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp
	metar
	tenacity; extra == 'retry'
	yarl
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/metar[${PYTHON_USEDEP}]
	retry? ( dev-python/tenacity[${PYTHON_USEDEP}] )
	dev-python/yarl[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
