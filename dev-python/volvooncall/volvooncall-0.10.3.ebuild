# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Communicate with VOC"
HOMEPAGE="
  https://pypi.org/project/volvooncall/
"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="console mqtt test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	aiohttp
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	console? ( dev-python/certifi[${PYTHON_USEDEP}] >=sci-geosciences/geopy-1.14.0[${PYTHON_USEDEP}] )
	mqtt? ( dev-python/certifi[${PYTHON_USEDEP}] dev-python/amqtt[${PYTHON_USEDEP}] )"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
