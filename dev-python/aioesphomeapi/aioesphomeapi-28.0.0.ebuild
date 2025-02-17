# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python API for interacting with ESPHome devices."
HOMEPAGE="
  https://pypi.org/project/aioesphomeapi/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	aiohappyeyeballs>=2.3.0
	async-interrupt>=1.2.0
	async-timeout>=4.0; python_version < '3.11'
	chacha20poly1305-reuseable>=0.13.2
	cryptography>=43.0.0
	noiseprotocol<1.0,>=0.3.1
	protobuf>=4
	zeroconf<1.0,>=0.132.2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohappyeyeballs-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/async-interrupt-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/chacha20poly1305-reuseable-0.13.2[${PYTHON_USEDEP}]
	>=dev-python/cryptography-43.0.0[${PYTHON_USEDEP}]
	>=dev-python/noiseprotocol-0.3.1[${PYTHON_USEDEP}] <dev-python/noiseprotocol-1.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-4[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.132.2[${PYTHON_USEDEP}] <dev-python/zeroconf-1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohappyeyeballs-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/async-interrupt-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.19.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.132.2[${PYTHON_USEDEP}]
	>=dev-python/chacha20poly1305-reuseable-0.13.2[${PYTHON_USEDEP}]
	>=dev-python/cryptography-43.0.0[${PYTHON_USEDEP}]
	>=dev-python/noiseprotocol-0.3.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
