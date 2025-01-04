# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asyncio Network UPS Tools"
HOMEPAGE="
  https://pypi.org/project/aionut/
  Bug Tracker, https://github.com/bdraco/aionut/issues
  Changelog, https://github.com/bdraco/aionut/blob/main/CHANGELOG.md
  Documentation, https://aionut.readthedocs.io
  Repository, https://github.com/bdraco/aionut
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest