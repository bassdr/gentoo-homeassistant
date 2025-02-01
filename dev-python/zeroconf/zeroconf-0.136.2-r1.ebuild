# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A pure python implementation of multicast DNS service discovery"
HOMEPAGE="
  https://pypi.org/project/zeroconf/
  Bug Tracker, https://github.com/python-zeroconf/python-zeroconf/issues
  Changelog, https://github.com/python-zeroconf/python-zeroconf/blob/master/CHANGELOG.md
  Documentation, https://python-zeroconf.readthedocs.io
  Repository, https://github.com/python-zeroconf/python-zeroconf
"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/ifaddr-0.1.7[${PYTHON_USEDEP}]
	dev-python/ifaddr[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/ifaddr-0.1.7[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/async-timeout-3.0.0[${PYTHON_USEDEP}]
	' 3.10)
"
# the build system uses custom build script that uses distutils to build
# C extensions, sigh
BDEPEND="
	>=dev-python/cython-3.0.8[${PYTHON_USEDEP}]
	>=dev-python/setuptools-65.6.3[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

export REQUIRE_CYTHON=1

python_test() {
	local -x SKIP_IPV6=1
	local EPYTEST_DESELECT=(
		# network
		tests/test_core.py::Framework::test_close_multiple_times
		tests/test_core.py::Framework::test_launch_and_close
		tests/test_core.py::Framework::test_launch_and_close_context_manager

		# fragile to timeouts (?)
		tests/services/test_browser.py::test_service_browser_expire_callbacks
		tests/utils/test_asyncio.py::test_run_coro_with_timeout
	)

	epytest -o addopts=
}
