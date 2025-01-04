# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python API for talking to Monoprice Blackbird 4k 8x8 HDBaseT Matrix"
HOMEPAGE="
  https://pypi.org/project/pyblackbird/
  Homepage, https://github.com/koolsb/pyblackbird
  Bug Tracker, https://github.com/koolsb/pyblackbird/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"
src_prepare() {
	eapply "${FILESDIR}"/${P}-setup-fails.patch
	eapply_user

}
python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
