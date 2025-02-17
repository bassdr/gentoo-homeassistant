# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="PS4 2nd Screen Python Library"
HOMEPAGE="
  https://pypi.org/project/pyps4-2ndscreen/
"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	aiohttp (>=3.5.4)
	click (>=7.0)
	construct (>=2.9.45)
	pycryptodomex (>=3.7.2)
	windows-curses (>=2.1.0) ; platform_system == 'Windows'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.5.4[${PYTHON_USEDEP}]
	>=dev-python/click-7.0[${PYTHON_USEDEP}]
	>=dev-python/construct-2.9.45[${PYTHON_USEDEP}]
	>=dev-python/pycryptodomex-3.7.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/construct-2.9.45[${PYTHON_USEDEP}]
	>=dev-python/pycryptodomex-3.7.2[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.5.4[${PYTHON_USEDEP}]
	>=dev-python/click-7.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
