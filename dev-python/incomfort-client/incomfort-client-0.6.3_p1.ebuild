# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="An aiohttp-based client for Intergas InComfort/InTouch Lan2RF systems"
HOMEPAGE="
  https://pypi.org/project/incomfort-client/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/aioresponses[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
>=dev-python/aioresponses-0.7.6[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"
python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# SRC_URI could not be inserted in this ebuild
# Content: 
