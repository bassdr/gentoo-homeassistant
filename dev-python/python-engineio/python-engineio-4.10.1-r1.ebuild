# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Engine.IO server and client for Python"
HOMEPAGE="
  https://pypi.org/project/python-engineio/
  Homepage, https://github.com/miguelgrinberg/python-engineio
  Bug Tracker, https://github.com/miguelgrinberg/python-engineio/issues
"
SRC_URI="
	https://github.com/miguelgrinberg/python-engineio/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="asyncio-client client docs"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	asyncio-client? ( >=dev-python/aiohttp-3.4[${PYTHON_USEDEP}] )
	client? ( >=dev-python/requests-2.21.0[${PYTHON_USEDEP}] )
	>=dev-python/simple-websocket-0.10.0[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	client? ( >=dev-python/websocket-client-0.54.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/simple-websocket-0.10.0[${PYTHON_USEDEP}]
	dev-python/websocket-client[${PYTHON_USEDEP}]
"
# Can use eventlet, werkzeug, or gevent, but no tests for werkzeug
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/tornado[${PYTHON_USEDEP}]
		dev-python/websockets[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
distutils_enable_sphinx docs \
	dev-python/alabaster

python_test() {
	local EPYTEST_IGNORE=(
		# eventlet is masked for removal
		tests/common/test_async_eventlet.py
	)

	local EPYTEST_DESELECT=(
		# also eventlet
		tests/common/test_server.py::TestServer::test_async_mode_eventlet
		tests/common/test_server.py::TestServer::test_connect
		tests/common/test_server.py::TestServer::test_service_task_started
		tests/common/test_server.py::TestServer::test_upgrades
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p asyncio
}
