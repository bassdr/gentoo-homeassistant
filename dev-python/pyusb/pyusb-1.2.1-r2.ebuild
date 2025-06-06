# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION="Python USB access module"
HOMEPAGE="
  https://pypi.org/project/pyusb/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

### This version is compatible with both 0.X and 1.X versions of libusb
DEPEND="virtual/libusb:="
RDEPEND="${DEPEND}"

DOCS=( README.rst docs/tutorial.rst )

PATCHES=(
	"${FILESDIR}"/${P}-setuptools.patch
)

python_test() {
	cd tests || die
	"${EPYTHON}" testall.py || die "Tests failed with ${EPYTHON}"
}
