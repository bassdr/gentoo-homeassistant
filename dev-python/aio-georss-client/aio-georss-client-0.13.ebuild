# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="An async GeoRSS client library."
HOMEPAGE="
  https://pypi.org/project/aio-georss-client/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp<4,>=3.7.4
	haversine>=2.8.1
	python-dateutil>=2.9.0
	xmltodict>=0.13.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}] <dev-python/aiohttp-4[${PYTHON_USEDEP}]
	>=dev-python/haversine-2.8.1[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
