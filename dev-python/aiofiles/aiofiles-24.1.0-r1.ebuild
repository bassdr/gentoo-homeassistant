# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="File support for asyncio."
HOMEPAGE="
  https://pypi.org/project/aiofiles/
  Changelog, https://github.com/Tinche/aiofiles#history
  Bug Tracker, https://github.com/Tinche/aiofiles/issues
  repository, https://github.com/Tinche/aiofiles
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
