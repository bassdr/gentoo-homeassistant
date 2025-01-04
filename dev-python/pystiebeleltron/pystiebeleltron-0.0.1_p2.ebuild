# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Python API for interacting with the Stiebel Eltron ISG web gateway via Modbus for controlling integral ventilation units and heat pumps."
HOMEPAGE="
  https://pypi.org/project/pystiebeleltron/
"
MY_PN="python-stiebel-eltron"
COMMIT="536367f6b272b13f33437ad33a6cc6b5c6ab55d3"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/pymodbus[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/pymodbus-2.1.0[${PYTHON_USEDEP}]"
BDEPEND="
	app-arch/unzip
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed -i "s/packages=find_packages()/packages=find_packages(exclude=['test'])/g" -i setup.py || die
	eapply_user
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# SRC_URI could not be inserted in this ebuild
# Content: 
