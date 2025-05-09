# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python client for Tailwind garage door openers."
HOMEPAGE="
  https://pypi.org/project/gotailwind/
  Bug Tracker, https://github.com/frenck/python-gotailwind/issues
  Changelog, https://github.com/frenck/python-gotailwind/releases
  Documentation, https://github.com/frenck/python-gotailwind
  Repository, https://github.com/frenck/python-gotailwind
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
	awesomeversion>=22.8.0
	backoff>=2.2.1
	mashumaro>=3.10
	orjson>=3.9.8
	typer[all]>=0.9; extra == 'cli'
	yarl>=1.6.0
	zeroconf>=0.126.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/awesomeversion-22.8.0[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.10[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.8[${PYTHON_USEDEP}]
	cli? ( >=dev-python/typer-0.9[all,${PYTHON_USEDEP}] )
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.126.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/awesomeversion-22.8.0[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.10[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.8[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.126.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
