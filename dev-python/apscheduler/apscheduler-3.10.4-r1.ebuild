# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN=APScheduler
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apscheduler/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc gevent mongodb redis rethinkdb sqlalchemy testing tornado twisted zookeeper"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	gevent? ( dev-python/gevent[${PYTHON_USEDEP}] )
	>=dev-python/importlib-metadata-3.6.0[${PYTHON_USEDEP}]
	zookeeper? ( dev-python/kazoo[${PYTHON_USEDEP}] )
	mongodb? ( >=dev-python/pymongo-3.0[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-tornado5[${PYTHON_USEDEP}] )
	dev-python/pytz[${PYTHON_USEDEP}]
	redis? ( >=dev-python/redis-3.0[${PYTHON_USEDEP}] )
	rethinkdb? ( >=dev-python/rethinkdb-2.4.0[${PYTHON_USEDEP}] )
	>=dev-python/six-1.4.0[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	sqlalchemy? ( >=dev-python/sqlalchemy-1.4[${PYTHON_USEDEP}] )
	tornado? ( >=dev-python/tornado-4.3[${PYTHON_USEDEP}] )
	twisted? ( dev-python/twisted[${PYTHON_USEDEP}] )
	!=dev-python/tzlocal-3*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/tzlocal-4[${PYTHON_USEDEP}]
"
BDEPEND="
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
