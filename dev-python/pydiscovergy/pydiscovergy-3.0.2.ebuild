# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Async Python 3 library for interacting with Discovergy smart meters API"
HOMEPAGE="
  https://pypi.org/project/pydiscovergy/
  Bug Tracker, https://github.com/jpbede/pydiscovergy/issues
  Changelog, https://github.com/jpbede/pydiscovergy/releases
  Repository, https://github.com/jpbede/pydiscovergy
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.md"

REQUIRES_DIST="
	authlib>=0.15
	httpx>=0.24
	mashumaro>=3.11
	orjson>=3.9.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/authlib-0.15[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.24[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.11[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-httpx[${PYTHON_USEDEP}]
		dev-python/respx[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
