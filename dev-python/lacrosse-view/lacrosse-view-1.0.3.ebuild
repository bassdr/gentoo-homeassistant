# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Client for retrieving data from the La Crosse View cloud"
HOMEPAGE="
  https://pypi.org/project/lacrosse-view/
  Bug Tracker, https://github.com/IceBotYT/lacrosse_view/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp>=3.8.1
	aiozoneinfo>=0.2.1
	pydantic<3.0.0,>=1.9.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
	>=dev-python/aiozoneinfo-0.2.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.0[${PYTHON_USEDEP}] <dev-python/pydantic-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/aiozoneinfo-0.2.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
