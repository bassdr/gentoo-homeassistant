# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A client library for Apple TV and AirPlay devices"
HOMEPAGE="
  https://pypi.org/project/pyatv/
  Repository, https://github.com/postlund/pyatv
  Bug Reports, https://github.com/postlund/pyatv/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp<5,>=3.8.3
	async-timeout>=4.0.2
	chacha20poly1305-reuseable>=0.13.2
	cryptography>=43.0.0
	ifaddr>=0.1.7
	miniaudio>=1.45
	protobuf>=5.28.1
	pydantic>=1.10.10
	requests>=2.30.0
	srptools>=0.2.0
	tabulate>=0.9.0
	tinytag>=1.10.0
	zeroconf>=0.129.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8.3[${PYTHON_USEDEP}] <dev-python/aiohttp-5[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-4.0.2[${PYTHON_USEDEP}]
	>=dev-python/chacha20poly1305-reuseable-0.13.2[${PYTHON_USEDEP}]
	>=dev-python/cryptography-43.0.0[${PYTHON_USEDEP}]
	>=dev-python/ifaddr-0.1.7[${PYTHON_USEDEP}]
	>=dev-python/miniaudio-1.45[${PYTHON_USEDEP}]
	>=dev-python/protobuf-5.28.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10.10[${PYTHON_USEDEP}]
	>=dev-python/requests-2.30.0[${PYTHON_USEDEP}]
	>=dev-python/srptools-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/tinytag-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.129.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.8.3[${PYTHON_USEDEP}]
	>=dev-python/chacha20poly1305-reuseable-0.13.2[${PYTHON_USEDEP}]
	>=dev-python/cryptography-43.0.0[${PYTHON_USEDEP}]
	>=dev-python/ifaddr-0.1.7[${PYTHON_USEDEP}]
	>=dev-python/mediafile-0.8.1[${PYTHON_USEDEP}]
	>=dev-python/miniaudio-1.45[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10.10[${PYTHON_USEDEP}]
	>=dev-python/requests-2.23.0[${PYTHON_USEDEP}]
	>=dev-python/srptools-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.129.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-runner[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
