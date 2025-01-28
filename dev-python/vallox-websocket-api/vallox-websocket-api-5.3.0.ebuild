# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Vallox WebSocket API"
HOMEPAGE="
  https://pypi.org/project/vallox-websocket-api/
  Bug Tracker, https://github.com/yozik04/vallox_websocket_api/issues
"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	<dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	<dev-python/construct-3.0.0[${PYTHON_USEDEP}]
	dev-python/construct[${PYTHON_USEDEP}]
	>=dev-python/websockets-9.1[${PYTHON_USEDEP}]
	dev-python/websockets[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/websockets-9.1[${PYTHON_USEDEP}]
		 >=dev-python/construct-2.9.0[${PYTHON_USEDEP}]
		 <dev-python/construct-3.0.0[${PYTHON_USEDEP}]
		 dev-python/aiohttp[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/wheel[${PYTHON_USEDEP}]
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/asynctest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
