# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="PyNINA"
inherit distutils-r1 pypi

DESCRIPTION="A Python API wrapper to retrieve warnings from the german NINA app."
HOMEPAGE="
  https://pypi.org/project/pynina/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp>=3.11.6
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.11.6[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
