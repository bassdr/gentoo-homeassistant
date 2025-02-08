# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python wrapper for EcoWitt Protocol"
HOMEPAGE="
  https://pypi.org/project/aioecowitt/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp >3
	meteocalc >=1.1.0
"
GENERATED_RDEPEND="${RDEPEND}
	>dev-python/aiohttp-3[${PYTHON_USEDEP}]
	>=dev-python/meteocalc-1.1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/meteocalc-1.1.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
