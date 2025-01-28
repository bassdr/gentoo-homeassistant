# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python library used by Home Assistant to interact with the WeatherFlow REST API"
HOMEPAGE="
  https://pypi.org/project/weatherflow4py/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	>=dev-python/aiohttp-3.9.1[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	<dev-python/dataclasses-json-0.7.0[${PYTHON_USEDEP}]
	dev-python/dataclasses-json[${PYTHON_USEDEP}]
	<dev-python/marshmallow-4.0.0[${PYTHON_USEDEP}]
	dev-python/marshmallow[${PYTHON_USEDEP}]
	>=dev-python/websockets-11.0[${PYTHON_USEDEP}]
	dev-python/websockets[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/dataclasses-json-0.6.3[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.9.1[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-3.20.1[${PYTHON_USEDEP}]
	dev-python/websockets[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
