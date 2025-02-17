# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/hishel/"
SRC_URI="https://github.com/karpetrosyan/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="redis s3 sqlite yaml"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	anysqlite>=0.0.5; extra == 'sqlite'
	boto3<=1.15.3,>=1.15.0; python_version < '3.12' and extra == 's3'
	boto3>=1.15.3; python_version >= '3.12' and extra == 's3'
	httpx>=0.22.0
	pyyaml==6.0.1; extra == 'yaml'
	redis==5.0.1; extra == 'redis'
	typing-extensions>=4.8.0
"
GENERATED_RDEPEND="${RDEPEND}
	sqlite? ( >=dev-python/anysqlite-0.0.5[${PYTHON_USEDEP}] )
	s3? ( >=dev-python/boto3-1.15.3[${PYTHON_USEDEP}] )
	>=dev-python/httpx-0.22.0[${PYTHON_USEDEP}]
	yaml? ( ~dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}] )
	redis? ( ~dev-python/redis-5.0.1[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.8.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/httpx[${PYTHON_USEDEP}]
"

BDEPEND="
	${RDEPEND}
	dev-python/hatch-fancy-pypi-readme[${PYTHON_USEDEP}]
	test? (
		dev-db/redis
		dev-python/anyio[${PYTHON_USEDEP}]
		dev-python/boto3[${PYTHON_USEDEP}]
		dev-python/moto[${PYTHON_USEDEP}]
		dev-python/redis[${PYTHON_USEDEP}]
		dev-python/trio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_prepare_all() {
	sed -e 's:mock_s3:mock_aws:g' \
		-e '/import anysqlite/ d' \
		-i tests/_async/test_storages.py \
		tests/_sync/test_storages.py || die

	distutils-r1_python_prepare_all
}

src_test() {
	local EPYTEST_DESELECT=(
		# tests that need anysqlite
		tests/_async/test_storages.py::test_sqlitestorage
		tests/_async/test_storages.py::test_sqlite_expired
		tests/_async/test_storages.py::test_sqlite_ttl_after_hits
	)

	local redis_pid="${T}"/redis.pid
	local redis_port=6379

	einfo "Starting Redis"
	"${EPREFIX}"/usr/sbin/redis-server - <<- EOF
		daemonize yes
		pidfile ${redis_pid}
		port ${redis_port}
		bind 127.0.0.1 ::1
	EOF

	# Run the tests
	distutils-r1_src_test

	# Clean up afterwards
	kill "$(<"${redis_pid}")" || die
}
