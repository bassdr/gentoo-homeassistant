# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python client for the Radio Browser API"
HOMEPAGE="
  https://pypi.org/project/radios/
  Bug Tracker, https://github.com/frenck/python-radios/issues
  Changelog, https://github.com/frenck/python-radios/releases
  Documentation, https://github.com/frenck/python-radios
  Repository, https://github.com/frenck/python-radios
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiodns>=3.0
	aiohttp>=3.0.0
	awesomeversion>=21.10.1
	backoff>=1.9.0
	cachetools>=4.0.0
	mashumaro>=3.10
	orjson>=3.9.8
	pycountry<25.0.0,>=24.0.0
	yarl>=1.6.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiodns-3.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/awesomeversion-21.10.1[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/cachetools-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.10[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.8[${PYTHON_USEDEP}]
	>=dev-python/pycountry-24.0.0[${PYTHON_USEDEP}] <dev-python/pycountry-25.0.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiodns-3.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/awesomeversion-21.10.1[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/cachetools-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.10[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.8[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/pycountry-24.0.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/aresponses[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
