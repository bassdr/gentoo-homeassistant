# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="multi backend asyncio cache"
HOMEPAGE="
  https://pypi.org/project/aiocache/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="memcached msgpack redis"
IUSE="${GENERATED_IUSE}"

DOCS="README.rst"

REQUIRES_DIST="
	aiomcache>=0.5.2; extra == 'memcached'
	msgpack>=0.5.5; extra == 'msgpack'
	redis>=4.2.0; extra == 'redis'
"
GENERATED_RDEPEND="${RDEPEND}
	memcached? ( >=dev-python/aiomcache-0.5.2[${PYTHON_USEDEP}] )
	msgpack? ( >=dev-python/msgpack-0.5.5[${PYTHON_USEDEP}] )
	redis? ( >=dev-python/redis-4.2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
