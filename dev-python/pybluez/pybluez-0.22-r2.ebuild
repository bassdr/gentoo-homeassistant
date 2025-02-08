# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_PN="PyBluez"
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url --no-normalize ${PYPI_PN} ${PV} .zip)"

DESCRIPTION="Bluetooth Python extension module"
HOMEPAGE="
  https://pypi.org/project/pybluez/
"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

PATCHES=("${FILESDIR}/${PV}_py311.patch")

RDEPEND="net-wireless/bluez[experimental]"
BDEPEND="
	app-arch/unzip
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}
# GENERATED_BDEPEND could not be inserted in this ebuild
# BDEPEND could not be inserted in this ebuild
