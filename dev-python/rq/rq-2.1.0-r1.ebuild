# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/rq/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	click>=5
	redis>=3.5
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/click-5[${PYTHON_USEDEP}]
	>=dev-python/redis-3.5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/click-5.0[${PYTHON_USEDEP}]
	>=dev-python/redis-4.5.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-db/redis
		dev-python/psutil[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	# unnecessary typechecking deps
	sed -i -e '/types-/d' pyproject.toml || die
}

src_test() {
	local redis_pid="${T}"/redis.pid
	local redis_port=6379
	local redis_test_config="daemonize yes
		pidfile ${redis_pid}
		port ${redis_port}
		bind 127.0.0.1
	"

	# Spawn Redis itself for testing purposes
	# NOTE: On sam@'s machine, spawning Redis can hang in the sandbox.
	# I'm not restricting tests yet because this doesn't happen for anyone else AFAICT.
	einfo "Spawning Redis"
	einfo "NOTE: Port ${redis_port} must be free"
	/usr/sbin/redis-server - <<< "${redis_test_config}" || die

	# Run the actual tests
	distutils-r1_src_test

	# Clean up afterwards
	kill "$(<"${redis_pid}")" || die
}

python_test() {
	local EPYTEST_DESELECT=(
		# requires <sentry-sdk-2
		tests/test_sentry.py::TestSentry::test_failure_capture
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
