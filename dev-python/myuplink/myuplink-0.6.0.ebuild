# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="API package for myUplink"
HOMEPAGE="
  https://pypi.org/project/myuplink/
  Bug Tracker, https://github.com/pajzo/myuplink/issues
  repository, https://github.com/pajzo/myuplink
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp>=3.7.3
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.7.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
