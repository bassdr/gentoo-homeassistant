# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Python library to access the Solar-Log"
HOMEPAGE="
  https://pypi.org/project/solarlog-cli/
  Repository, https://github.com/dontinelli/solarlog_cli.git
  Issues, https://github.com/dontinelli/solarlog_cli/issues
  Changelog, https://github.com/dontinelli/solarlog_cli/blob/master/CHANGELOG.md
  Solar-Log homepage, https://www.solar-log.com/
  API Documentation (inofficial), https://github.com/iobroker-community-adapters/ioBroker.solarlog/blob/master/docs/solarlog_dataobjects.md
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp
	mashumaro>=3.13
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13[${PYTHON_USEDEP}]
"
BDEPEND="test? (
	>=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13[${PYTHON_USEDEP}]
	dev-python/aioresponses[${PYTHON_USEDEP}]
	~dev-python/pytest-aio-1.9.0[${PYTHON_USEDEP}]
	~dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
	~dev-python/syrupy-4.6.1[${PYTHON_USEDEP}]
)"

distutils_enable_tests pytest
