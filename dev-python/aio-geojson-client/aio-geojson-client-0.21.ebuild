# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="An async GeoJSON client library."
HOMEPAGE="
  https://pypi.org/project/aio-geojson-client/
  Repository, https://github.com/exxamalte/python-aio-geojson-client
  Issues, https://github.com/exxamalte/python-aio-geojson-client/issues
  Changelog, https://github.com/exxamalte/python-aio-geojson-client/blob/main/CHANGELOG.md
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/geojson[${PYTHON_USEDEP}]
	dev-python/haversine[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	>=dev-python/geojson-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/haversine-1.0.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
