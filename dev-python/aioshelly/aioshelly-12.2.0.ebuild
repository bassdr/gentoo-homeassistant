# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous library to control Shelly devices."
HOMEPAGE="
  https://pypi.org/project/aioshelly/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp>=3.11.1
	bluetooth-data-tools>=1.19.0
	habluetooth>=2.1.0
	orjson>=3.8.1
	yarl
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.11.1[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-1.19.0[${PYTHON_USEDEP}]
	>=dev-python/habluetooth-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.8.1[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-1.19.0[${PYTHON_USEDEP}]
	>=dev-python/habluetooth-2.1.0[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.8.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/requests[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed "s/packages=find_packages()/packages=find_packages(exclude=['tests','tests.*'])/g" -i setup.py || die
	eapply_user
}

distutils_enable_tests pytest
