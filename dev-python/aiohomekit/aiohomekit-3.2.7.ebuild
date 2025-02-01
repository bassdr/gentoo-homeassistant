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
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/aiocoap-0.4.5[${PYTHON_USEDEP}]
	dev-python/aiocoap[${PYTHON_USEDEP}]
	>=dev-python/aiohappyeyeballs-2.3.0[${PYTHON_USEDEP}]
	dev-python/aiohappyeyeballs[${PYTHON_USEDEP}]
	>=dev-python/async-interrupt-1.1.1[${PYTHON_USEDEP}]
	dev-python/async-interrupt[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.19.0[${PYTHON_USEDEP}]
	dev-python/bleak[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-2.9.0[${PYTHON_USEDEP}]
	dev-python/bleak-retry-connector[${PYTHON_USEDEP}]
	<dev-python/chacha20poly1305-0.0.4[${PYTHON_USEDEP}]
	dev-python/chacha20poly1305[${PYTHON_USEDEP}]
	>=dev-python/chacha20poly1305-reuseable-0.12.1[${PYTHON_USEDEP}]
	dev-python/chacha20poly1305-reuseable[${PYTHON_USEDEP}]
	<dev-python/commentjson-0.10.0[${PYTHON_USEDEP}]
	dev-python/commentjson[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.9.2[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.7.8[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.132.2[${PYTHON_USEDEP}]
	dev-python/zeroconf[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
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
