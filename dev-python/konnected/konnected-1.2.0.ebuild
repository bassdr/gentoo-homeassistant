# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="An async Python library for interacting with Konnected home automation controllers (see https://konnected.io)"
HOMEPAGE="
  https://pypi.org/project/konnected/
  Homepage, https://github.com/konnected-io/konnected-py
  Website & Online Store, https://konnected.io
  Support and Community Forums, https://help.konnected.io
  Facebook, https://facebook.com/konnected.io
  YouTube Channel, https://youtube.com/c/Konnected
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
