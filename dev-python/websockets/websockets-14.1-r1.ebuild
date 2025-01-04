# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="An implementation of the WebSocket Protocol (RFC 6455 & 7692)"
HOMEPAGE="
  https://pypi.org/project/websockets/
  Homepage, https://github.com/python-websockets/websockets
  Changelog, https://websockets.readthedocs.io/en/stable/project/changelog.html
  Documentation, https://websockets.readthedocs.io/
  Funding, https://tidelift.com/subscription/pkg/pypi-websockets?utm_source=pypi-websockets&utm_medium=referral&utm_campaign=readme
  Tracker, https://github.com/python-websockets/websockets/issues
"
# tests are missing pypi sdist, as of 11.0
SRC_URI="
	https://github.com/python-websockets/websockets/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
	https://dev.gentoo.org/~sam/distfiles/${CATEGORY}/${PN}/${PN}-11.0.3-python3.12.patch.xz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="+native-extensions test"

BDEPEND="
	test? (
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_compile() {
	if use native-extensions && [[ ${EPYTHON} != pypy3 ]] ; then
		local -x BUILD_EXTENSION=yes
	else
		local -x BUILD_EXTENSION=no
	fi

	distutils-r1_python_compile
}

python_test() {
	local EPYTEST_DESELECT=(
		# requires DNS access
		# https://bugs.gentoo.org/909567
		tests/legacy/test_client_server.py::ClientServerTests::test_explicit_host_port
		tests/legacy/test_client_server.py::SecureClientServerTests::test_explicit_host_port
		# TODO
		tests/asyncio/test_server.py::ServerTests::test_close_server_keeps_handlers_running
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest tests -p rerunfailures --reruns=10 --reruns-delay=2
}
