# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all cachelib memcached mongodb redis sqlalchemy"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/flask-session/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Flask-Session[cachelib,memcached,mongodb,redis,sqlalchemy]; extra == 'all'
	cachelib
	cachelib>=0.10.2; extra == 'cachelib'
	flask-sqlalchemy>=3.0.5; extra == 'sqlalchemy'
	flask>=2.2
	msgspec>=0.18.6
	pymemcache; extra == 'memcached'
	pymongo>=4.6.2; extra == 'mongodb'
	redis>=5.0.3; extra == 'redis'
"
GENERATED_RDEPEND="${RDEPEND}
	cachelib? ( >=dev-python/cachelib-0.10.2[${PYTHON_USEDEP}] )
	dev-python/cachelib[${PYTHON_USEDEP}]
	>=dev-python/flask-2.2[${PYTHON_USEDEP}]
	all? ( dev-python/flask-session[cachelib,memcached,mongodb,redis,sqlalchemy,${PYTHON_USEDEP}] )
	sqlalchemy? ( >=dev-python/flask-sqlalchemy-3.0.5[${PYTHON_USEDEP}] )
	>=dev-python/msgspec-0.18.6[${PYTHON_USEDEP}]
	memcached? ( dev-python/pymemcache[${PYTHON_USEDEP}] )
	mongodb? ( >=dev-python/pymongo-4.6.2[${PYTHON_USEDEP}] )
	redis? ( >=dev-python/redis-5.0.3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
