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
GENERATED_IUSE="isal zlib-ng"
IUSE="${GENERATED_IUSE} +isal +zlib_ng"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp>=3.9.0
	isal>=1.6.1; extra == 'isal'
	zlib_ng>=0.4.3; extra == 'zlib-ng'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	isal? ( >=dev-python/isal-1.6.1[${PYTHON_USEDEP}] )
	zlib-ng? ( >=dev-python/zlib-ng-0.4.3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	isal? ( >=dev-python/isal-1.6.1[${PYTHON_USEDEP}] )
	zlib_ng? ( >=dev-python/zlib-ng-0.4.3[${PYTHON_USEDEP}] )"
BDEPEND="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
