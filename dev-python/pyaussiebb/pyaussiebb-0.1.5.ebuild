# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Aussie Broadband API module"
HOMEPAGE="
  https://pypi.org/project/pyaussiebb/
  Documentation, https://yaleman.github.io/pyaussiebb/
  Issues, https://github.com/yaleman/pyaussiebb/issues/
  Repository, https://github.com/yaleman/pyaussiebb
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp<4.0.0,>=3.8.5
	pydantic<3.0,>=2.0
	requests<3.0.0,>=2.27.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8.5[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0[${PYTHON_USEDEP}] <dev-python/pydantic-3.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.27.1[${PYTHON_USEDEP}] <dev-python/requests-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
