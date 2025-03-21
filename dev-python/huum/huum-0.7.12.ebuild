# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python library for Huum saunas"
HOMEPAGE="
  https://pypi.org/project/huum/
  Repository, https://github.com/frwickst/pyhuum
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="aiohttp"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp[speedups]<4.0.0,>=3.9.5; extra == 'aiohttp'
	mashumaro<4.0.0,>=3.13.1
"
GENERATED_RDEPEND="${RDEPEND}
	aiohttp? ( >=dev-python/aiohttp-3.9.5[speedups,${PYTHON_USEDEP}] <dev-python/aiohttp-4.0.0[speedups,${PYTHON_USEDEP}] )
	>=dev-python/mashumaro-3.13.1[${PYTHON_USEDEP}] <dev-python/mashumaro-4.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
