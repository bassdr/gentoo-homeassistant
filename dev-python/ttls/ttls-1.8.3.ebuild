# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Twinkly Twinkly Little Star"
HOMEPAGE="
  https://pypi.org/project/ttls/
  Repository, https://github.com/jschlyter/ttls
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/colour[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/aiohttp-3.8.5[${PYTHON_USEDEP}]
	>=dev-python/colour-0.1.5[${PYTHON_USEDEP}]"

distutils_enable_tests pytest