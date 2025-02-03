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

GENERATED_RDEPEND="${RDEPEND}
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
	>=dev-python/geojson-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/haversine-2.8.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	>=dev-python/geojson-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/haversine-1.0.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/aioresponses[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
