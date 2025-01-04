# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="An generic async GeoJSON client library."
HOMEPAGE="
  https://pypi.org/project/aio-geojson-generic-client/
  Repository, https://github.com/exxamalte/python-aio-geojson-generic-client
  Issues, https://github.com/exxamalte/python-aio-geojson-generic-client/issues
  Changelog, https://github.com/exxamalte/python-aio-geojson-generic-client/blob/main/CHANGELOG.md
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aio-geojson-client[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/geojson[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/aio-geojson-client-0.20[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
	>=dev-python/geojson-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2019.01[${PYTHON_USEDEP}]"

distutils_enable_tests pytest