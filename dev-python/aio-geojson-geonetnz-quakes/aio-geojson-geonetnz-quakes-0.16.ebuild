# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="An async GeoJSON client library for GeoNet NZ Quakes feed."
HOMEPAGE="
  https://pypi.org/project/aio-geojson-geonetnz-quakes/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aio-geojson-client >=0.20
	aiohttp <4,>=3.7.4
	pytz >=2019.01
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aio-geojson-client-0.20[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}] <dev-python/aiohttp-4[${PYTHON_USEDEP}]
	>=dev-python/pytz-2019.01[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	>=dev-python/pytz-2019.01[${PYTHON_USEDEP}]
	>=dev-python/aio-geojson-client-0.20[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
