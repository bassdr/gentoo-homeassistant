# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="CORS support for aiohttp"
HOMEPAGE="
  https://pypi.org/project/aiohttp-cors/
"
SRC_URI="
	https://github.com/aio-libs/aiohttp-cors/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	aiohttp (>=1.1)
	typing; python_version < "3.5"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-1.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-1.1.1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/selenium[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	local PATCHES=(
		# https://github.com/aio-libs/aiohttp-cors/pull/278
		"${FILESDIR}/${P}-tests.patch"
		"${FILESDIR}/${P}-py3_7.patch"
		# https://github.com/aio-libs/aiohttp-cors/pull/412
		"${FILESDIR}/${P}-py3_11.patch"
	)

	# doesn't do anything, except for breaking pytest-8
	rm conftest.py || die

	distutils-r1_src_prepare
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -o addopts= -p aiohttp -p asyncio --asyncio-mode=auto
}

