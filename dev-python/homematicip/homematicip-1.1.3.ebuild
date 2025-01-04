# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="An API for the homematicip cloud"
HOMEPAGE="
  https://pypi.org/project/homematicip/
  Homepage, https://github.com/hahn-th/homematicip-rest-api
  Repository, https://github.com/hahn-th/homematicip-rest-api.git
  Issues, https://github.com/hahn-th/homematicip-rest-api/issues
  Changelog, https://github.com/hahn-th/homematicip-rest-api/blob/master/CHANGELOG.md
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/websocket-client[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/websockets[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/requests-2.24.0[${PYTHON_USEDEP}]
		>=dev-python/websocket-client-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/websockets-8.1[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.9[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
