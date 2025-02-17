# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Tool to flash firmware onto any Silicon Labs radio running EmberZNet, CPC multi-PAN, or just a bare Gecko Bootloader"
HOMEPAGE="
  https://pypi.org/project/universal-silabs-flasher/
  repository, https://github.com/NabuCasa/universal-silabs-flasher
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp
	async-timeout; python_version < '3.11'
	bellows>=0.42.0
	click>=8.0.0
	coloredlogs
	crc
	gpiod; platform_system == 'Linux'
	pyserial-asyncio-fast
	pytest-asyncio>=0.21.0; extra == 'testing'
	pytest-cov>=4.1.0; extra == 'testing'
	pytest-github-actions-annotate-failures; extra == 'testing'
	pytest-mock>=3.10.0; extra == 'testing'
	pytest-timeout>=2.1.0; extra == 'testing'
	pytest>=7.3.1; extra == 'testing'
	typing-extensions
	zigpy>=0.70.0
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/bellows-0.42.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
	dev-python/coloredlogs[${PYTHON_USEDEP}]
	dev-python/crc[${PYTHON_USEDEP}]
	dev-python/gpiod[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio-fast[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	>=dev-python/zigpy-0.70.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/click[${PYTHON_USEDEP}]
	>=dev-python/zigpy-0.70.0[${PYTHON_USEDEP}]
	dev-python/crc[${PYTHON_USEDEP}]
	>=dev-python/bellows-0.42.0[${PYTHON_USEDEP}]
	dev-python/gpiod[${PYTHON_USEDEP}]
	dev-python/coloredlogs[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)"

src_prepare() {
	# remove dynamic-versioning
	sed 's/dynamic = \["version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	sed 's/, "setuptools-git-versioning<2"//g' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-7.3.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.21.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.1.0[${PYTHON_USEDEP}]
		dev-python/pytest-github-actions-annotate-failures[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3.10.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-timeout-2.1.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
