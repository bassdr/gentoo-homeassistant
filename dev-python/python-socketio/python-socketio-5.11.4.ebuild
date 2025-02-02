# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Socket.IO server and client for Python"
HOMEPAGE="
  https://pypi.org/project/python-socketio/
  Homepage, https://github.com/miguelgrinberg/python-socketio
  Bug Tracker, https://github.com/miguelgrinberg/python-socketio/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="asyncio-client client docs"
IUSE="${GENERATED_IUSE} +asyncio-client client test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	asyncio-client? ( >=dev-python/aiohttp-3.4[${PYTHON_USEDEP}] )
	>=dev-python/bidict-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/python-engineio-4.8.0[${PYTHON_USEDEP}]
	client? ( >=dev-python/requests-2.21.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	client? ( >=dev-python/websocket-client-0.54.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/bidict-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/python-engineio-4.8.0[${PYTHON_USEDEP}]
	client? (
		>=dev-python/requests-2.21.0
		>=dev-python/websocket-client-0.54.0
	)
	asyncio-client? (
		>=dev-python/aiohttp-3.4
	)"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
