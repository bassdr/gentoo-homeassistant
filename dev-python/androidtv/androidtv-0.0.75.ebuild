# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi
DESCRIPTION="Communicate with an Android TV or Fire TV device via ADB over a network."
HOMEPAGE="
  https://pypi.org/project/androidtv/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="async usb"
IUSE="${GENERATED_IUSE} +async test usb"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	>=dev-python/adb-shell-0.4.0[${PYTHON_USEDEP}]
	dev-python/adb-shell[${PYTHON_USEDEP}]
	usb? ( >=dev-python/adb-shell-0.4.0[usb,${PYTHON_USEDEP}] )
	async? ( >=dev-python/aiofiles-0.4.0[${PYTHON_USEDEP}] )
	async? ( >=dev-python/async-timeout-3.0.0[${PYTHON_USEDEP}] )
	>=dev-python/pure-python-adb-0.3.0_p0[${PYTHON_USEDEP}]
	dev-python/pure-python-adb[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	async? ( >=dev-python/aiofiles-0.4.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_10) )
	>=dev-python/pure-python-adb-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/adb-shell-0.4.0[usb?,${PYTHON_USEDEP}]
	>=dev-python/aiofiles-0.4.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
