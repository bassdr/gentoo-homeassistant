# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Use the fastest installed zlib compatible library with aiohttp"
HOMEPAGE="
  https://pypi.org/project/aiohttp-fast-zlib/
  Bug Tracker, https://github.com/bdraco/aiohttp-fast-zlib/issues
  Changelog, https://github.com/bdraco/aiohttp-fast-zlib/blob/main/CHANGELOG.md
  Repository, https://github.com/bdraco/aiohttp-fast-zlib
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/isal[${PYTHON_USEDEP}]
	dev-python/zlib-ng[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
