# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Samsung Smart TV WS API wrapper"
HOMEPAGE="
  https://pypi.org/project/samsungtvws/
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="async encrypted"
IUSE="${GENERATED_IUSE} +async +encrypted test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	async? ( >=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}] )
	encrypted? ( >=dev-python/cryptography-35.0.0[${PYTHON_USEDEP}] )
	encrypted? ( >=dev-python/py3rijndael-0.3.3[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.21.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.57.0[${PYTHON_USEDEP}]
	dev-python/websocket-client[${PYTHON_USEDEP}]
	async? ( >=dev-python/websockets-13[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/websocket-client-0.57.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.21.0[${PYTHON_USEDEP}]
	async? ( >=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
		   >=dev-python/websockets-13[${PYTHON_USEDEP}] )
	encrypted? ( >=dev-python/cryptography-35.0.0[${PYTHON_USEDEP}]
		   >=dev-python/py3rijndael-0.3.3[${PYTHON_USEDEP}] )"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
