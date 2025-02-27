# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Simple Arve library"
HOMEPAGE="
  https://pypi.org/project/asyncarve/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp>=3.9.3
	aresponses; extra == 'dev'
	mashumaro>=3.12
	orjson>=2.0.1
	pytest; extra == 'dev'
	twine; extra == 'dev'
	yarl>=1.9.4
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.9.3[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.12[${PYTHON_USEDEP}]
	>=dev-python/orjson-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/orjson-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.12[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.9.3[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9.4[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/aresponses[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/twine[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
