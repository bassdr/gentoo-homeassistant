# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="An asyncio HomeKit client"
HOMEPAGE="
  https://pypi.org/project/aiohomekit/
  Repository, https://github.com/Jc2k/aiohomekit
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiocoap>=0.4.5
	aiohappyeyeballs>=2.3.0
	async-interrupt>=1.1.1
	async-timeout>=4.0.2; python_version < "3.11"
	bleak-retry-connector>=2.9.0
	bleak>=0.19.0
	chacha20poly1305-reuseable>=0.12.1
	chacha20poly1305<0.0.4,>=0.0.3
	commentjson<0.10.0,>=0.9.0
	cryptography>=2.9.2
	orjson>=3.7.8
	zeroconf>=0.132.2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiocoap-0.4.5[${PYTHON_USEDEP}]
	>=dev-python/aiohappyeyeballs-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/async-interrupt-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/chacha20poly1305-0.0.3[${PYTHON_USEDEP}] <dev-python/chacha20poly1305-0.0.4[${PYTHON_USEDEP}]
	>=dev-python/chacha20poly1305-reuseable-0.12.1[${PYTHON_USEDEP}]
	>=dev-python/commentjson-0.9.0[${PYTHON_USEDEP}] <dev-python/commentjson-0.10.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.9.2[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.7.8[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.132.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/cryptography-2.9.2[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.132.2[${PYTHON_USEDEP}]
	>=dev-python/commentjson-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/aiocoap-0.4.5[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/chacha20poly1305-reuseable-0.12.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.7.8[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_10)
	>=dev-python/chacha20poly1305-0.0.3[${PYTHON_USEDEP}]
	>=dev-python/async-interrupt-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/aiohappyeyeballs-2.3.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/asynctest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
