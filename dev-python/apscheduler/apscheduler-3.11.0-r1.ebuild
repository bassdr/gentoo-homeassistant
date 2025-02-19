# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apscheduler/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc etcd gevent mongodb redis rethinkdb sqlalchemy test tornado twisted zookeeper"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	APScheduler[etcd,mongodb,redis,rethinkdb,sqlalchemy,tornado,zookeeper]; extra == 'test'
	PySide6; (platform_python_implementation == 'CPython' and python_version < '3.14') and extra == 'test'
	anyio>=4.5.2; extra == 'test'
	backports.zoneinfo; python_version < '3.9'
	etcd3; extra == 'etcd'
	gevent; extra == 'gevent'
	gevent; python_version < '3.14' and extra == 'test'
	kazoo; extra == 'zookeeper'
	packaging; extra == 'doc'
	protobuf<=3.21.0; extra == 'etcd'
	pymongo>=3.0; extra == 'mongodb'
	pytest; extra == 'test'
	pytz; extra == 'test'
	redis>=3.0; extra == 'redis'
	rethinkdb>=2.4.0; extra == 'rethinkdb'
	sphinx-rtd-theme>=1.3.0; extra == 'doc'
	sphinx; extra == 'doc'
	sqlalchemy>=1.4; extra == 'sqlalchemy'
	tornado>=4.3; extra == 'tornado'
	twisted; extra == 'twisted'
	twisted; python_version < '3.14' and extra == 'test'
	tzlocal>=3.0
"
GENERATED_RDEPEND="${RDEPEND}
	etcd? ( dev-python/etcd3[${PYTHON_USEDEP}] )
	gevent? ( dev-python/gevent[${PYTHON_USEDEP}] )
	zookeeper? ( dev-python/kazoo[${PYTHON_USEDEP}] )
	doc? ( dev-python/packaging[${PYTHON_USEDEP}] )
	etcd? ( <=dev-python/protobuf-3.21.0[${PYTHON_USEDEP}] )
	mongodb? ( >=dev-python/pymongo-3.0[${PYTHON_USEDEP}] )
	redis? ( >=dev-python/redis-3.0[${PYTHON_USEDEP}] )
	rethinkdb? ( >=dev-python/rethinkdb-2.4.0[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-rtd-theme-1.3.0[${PYTHON_USEDEP}] )
	sqlalchemy? ( >=dev-python/sqlalchemy-1.4[${PYTHON_USEDEP}] )
	tornado? ( >=dev-python/tornado-4.3[${PYTHON_USEDEP}] )
	twisted? ( dev-python/twisted[${PYTHON_USEDEP}] )
	>=dev-python/tzlocal-3.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/tzlocal-4[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/anyio-4.5.2[${PYTHON_USEDEP}]
		dev-python/apscheduler[etcd,mongodb,redis,rethinkdb,sqlalchemy,tornado,zookeeper,${PYTHON_USEDEP}]
		dev-python/gevent[${PYTHON_USEDEP}]
		dev-python/pyside6[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		dev-python/twisted[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		>=dev-python/anyio-4.5.2[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-1.4[${PYTHON_USEDEP}]
		dev-python/tornado[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

PATCHES=(
	# disable test fixtures using external servers (mongodb, redis...)
	"${FILESDIR}"/apscheduler-3.11.0-external-server-tests.patch
)

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p anyio
}
