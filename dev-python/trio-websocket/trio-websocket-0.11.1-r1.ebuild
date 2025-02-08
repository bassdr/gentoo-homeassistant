# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="WebSocket library for Trio"
HOMEPAGE="
  https://pypi.org/project/trio-websocket/
  Bug Reports, https://github.com/python-trio/trio-websocket/issues
  Source, https://github.com/python-trio/trio-websocket
"
SRC_URI="
	https://github.com/python-trio/trio-websocket/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	exceptiongroup ; python_version < "3.11"
	trio >=0.11
	wsproto >=0.14
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/trio-0.11[${PYTHON_USEDEP}]
	>=dev-python/wsproto-0.14[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	$(python_gen_cond_dep '
		dev-python/exceptiongroup[${PYTHON_USEDEP}]
	' 3.10)
	>=dev-python/trio-0.11[${PYTHON_USEDEP}]
	>=dev-python/wsproto-0.14[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-trio-0.5.0[${PYTHON_USEDEP}]
		dev-python/trustme[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# exception tests are broken with trio-0.25
		# https://github.com/python-trio/trio-websocket/issues/187
		tests/test_connection.py::test_handshake_exception_before_accept
		tests/test_connection.py::test_reject_handshake
		tests/test_connection.py::test_reject_handshake_invalid_info_status
		tests/test_connection.py::test_client_open_timeout
		tests/test_connection.py::test_client_close_timeout
		tests/test_connection.py::test_client_connect_networking_error
		tests/test_connection.py::test_finalization_dropped_exception
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p trio
}
