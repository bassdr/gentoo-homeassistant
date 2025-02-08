# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asyncio SolarEdge"
HOMEPAGE="
  https://pypi.org/project/aiosolaredge/
  Bug Tracker, https://github.com/bdraco/aiosolaredge/issues
  Changelog, https://github.com/bdraco/aiosolaredge/blob/main/CHANGELOG.md
  Documentation, https://aiosolaredge.readthedocs.io
  Repository, https://github.com/bdraco/aiosolaredge
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp>=3.9.0
	yarl>=1.9.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/aioresponses[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
