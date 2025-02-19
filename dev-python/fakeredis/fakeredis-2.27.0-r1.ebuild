# Copyright 2020-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fakeredis/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="bf cf json lua probabilistic"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	jsonpath-ng<2.0,>=1.6; extra == 'json'
	lupa<3.0,>=2.1; extra == 'lua'
	pyprobables<0.7,>=0.6; extra == 'bf' or extra == 'cf' or extra == 'probabilistic'
	redis>=4.3; python_full_version > '3.8.0'
	redis>=4; python_version < '3.8'
	sortedcontainers<3,>=2
	typing-extensions<5.0,>=4.7; python_version < '3.11'
"
GENERATED_RDEPEND="${RDEPEND}
	json? ( >=dev-python/jsonpath-ng-1.6[${PYTHON_USEDEP}] <dev-python/jsonpath-ng-2.0[${PYTHON_USEDEP}] )
	lua? ( >=dev-python/lupa-2.1[${PYTHON_USEDEP}] <dev-python/lupa-3.0[${PYTHON_USEDEP}] )
	cf? ( >=dev-python/pyprobables-0.6[${PYTHON_USEDEP}] <dev-python/pyprobables-0.7[${PYTHON_USEDEP}] ) bf? ( >=dev-python/pyprobables-0.6[${PYTHON_USEDEP}] <dev-python/pyprobables-0.7[${PYTHON_USEDEP}] ) probabilistic? ( >=dev-python/pyprobables-0.6[${PYTHON_USEDEP}] <dev-python/pyprobables-0.7[${PYTHON_USEDEP}] )
	>=dev-python/redis-4.3[${PYTHON_USEDEP}]
	>=dev-python/sortedcontainers-2[${PYTHON_USEDEP}] <dev-python/sortedcontainers-3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/redis-4.3[${PYTHON_USEDEP}]
	<dev-python/sortedcontainers-3[${PYTHON_USEDEP}]
	>=dev-python/sortedcontainers-2[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	' 3.10)
"
BDEPEND="
	test? (
		dev-db/redis
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	# https://github.com/cunla/fakeredis-py/issues/320
	sed -i -e '/LICENSE/d' pyproject.toml || die
}

python_test() {
	local EPYTEST_DESELECT=(
		# also lupa
		test/test_aioredis2.py::test_failed_script_error
		# TODO
		"test/test_fakeredis.py::test_set_get_nx[StrictRedis]"
		"test/test_fakeredis.py::test_lpop_count[StrictRedis]"
		"test/test_fakeredis.py::test_rpop_count[StrictRedis]"
		"test/test_fakeredis.py::test_zadd_minus_zero[StrictRedis]"
		"test/test_mixins/test_pubsub_commands.py::test_pubsub_channels[StrictRedis]"
		test/test_mixins/test_set_commands.py::test_smismember_wrong_type
		# new redis-server?
		"test/test_mixins/test_pubsub_commands.py::test_pubsub_shardnumsub[StrictRedis]"
		# json ext
		test/test_json/test_json.py
		test/test_json/test_json_arr_commands.py
		# tdigest ext?
		'test/test_mixins/test_server_commands.py::test_command[FakeStrictRedis]'
	)
	local EPYTEST_IGNORE=(
		# these tests fail a lot...
		test/test_hypothesis.py
	)
	local args=(
		# tests requiring lupa (lua support)
		-k 'not test_eval and not test_lua and not test_script'
	)
	# Note: this package is not xdist-friendly
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p asyncio -p pytest_mock "${args[@]}"
}

src_test() {
	local redis_pid="${T}"/redis.pid
	local redis_port=6390

	einfo "Spawning Redis"
	einfo "NOTE: Port ${redis_port} must be free"
	"${EPREFIX}"/usr/sbin/redis-server - <<- EOF || die "Unable to start redis server"
		daemonize yes
		pidfile ${redis_pid}
		port ${redis_port}
		bind 127.0.0.1
	EOF

	# Run the tests
	distutils-r1_src_test

	# Clean up afterwards
	kill "$(<"${redis_pid}")" || die
}
