# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python API for interacting with Glances"
HOMEPAGE="
  https://pypi.org/project/glances-api/
  Repository, https://github.com/home-assistant-ecosystem/python-glances-api/releases
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	httpx<1,>=0.23
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/httpx-0.23[${PYTHON_USEDEP}] <dev-python/httpx-1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/httpx-0.23[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-httpx[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
