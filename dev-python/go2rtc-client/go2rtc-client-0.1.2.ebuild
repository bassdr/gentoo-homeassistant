# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Python client for go2rtc"
HOMEPAGE="
  https://pypi.org/project/go2rtc-client/
  Homepage, https://pypi.org/project/go2rtc-client
  Source Code, https://github.com/home-assistant-libs/python-go2rtc-client
  Bug Reports, https://github.com/home-assistant-libs/python-go2rtc-client/issues
"
MY_P=${P/_beta/b}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp~=3.10
	awesomeversion~=24.6
	mashumaro~=3.13
	orjson~=3.10
	webrtc-models~=0.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.10[${PYTHON_USEDEP}] =dev-python/aiohttp-3*[${PYTHON_USEDEP}]
	>=dev-python/awesomeversion-24.6[${PYTHON_USEDEP}] =dev-python/awesomeversion-24*[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13[${PYTHON_USEDEP}] =dev-python/mashumaro-3*[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.10[${PYTHON_USEDEP}] =dev-python/orjson-3*[${PYTHON_USEDEP}]
	>=dev-python/webrtc-models-0.1[${PYTHON_USEDEP}] =dev-python/webrtc-models-0*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"
BDEPEND+="
	test? (
		dev-python/aioresponses[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed 's/aiohttp~=3.10/aiohttp/g' -i pyproject.toml || die
	sed 's/awesomeversion~=24.6/awesomeversion/g' -i pyproject.toml || die
	sed 's/mashumaro~=3.13/mashumaro/g' -i pyproject.toml || die
	sed 's/orjson~=3.10/orjson/g' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest
