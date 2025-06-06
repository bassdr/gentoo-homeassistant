# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A Python client library for A. O. Smith water heaters"
HOMEPAGE="
  https://pypi.org/project/py-aosmith/
  Documentation, https://github.com/bdr99/py-aosmith
  Repository, https://github.com/bdr99/py-aosmith
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp<4.0.0,>=3.8.6
	tenacity<9.0.0,>=8.2.3
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8.6[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.2.3[${PYTHON_USEDEP}] <dev-python/tenacity-9.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.8.6[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.2.3[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
