# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python client for WLED."
HOMEPAGE="
  https://pypi.org/project/wled/
  Bug Tracker, https://github.com/frenck/python-wled/issues
  Changelog, https://github.com/frenck/python-wled/releases
  Documentation, https://github.com/frenck/python-wled
  Repository, https://github.com/frenck/python-wled
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="cli"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp>=3.0.0
	awesomeversion>=22.1.0
	backoff>=2.2.0
	cachetools>=4.0.0
	mashumaro<4.0,>=3.13
	orjson>=3.9.8
	typer[all]<0.13.0,>=0.12.3; extra == "cli"
	yarl>=1.6.0
	zeroconf[all]<0.133.0,>=0.132.2; extra == "cli"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/awesomeversion-22.1.0[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/cachetools-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13[${PYTHON_USEDEP}] <dev-python/mashumaro-4.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.8[${PYTHON_USEDEP}]
	cli? ( >=dev-python/typer-0.12.3[all,${PYTHON_USEDEP}] <dev-python/typer-0.13.0[all,${PYTHON_USEDEP}] )
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]
	cli? ( >=dev-python/zeroconf-0.132.2[all,${PYTHON_USEDEP}] <dev-python/zeroconf-0.133.0[all,${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/awesomeversion-22.1.0[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/cachetools-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.8[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.12.3[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.132.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/aresponses[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
