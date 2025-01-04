# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1

DESCRIPTION="CRC Generator"
HOMEPAGE="
  https://pypi.org/project/crcmod/
"
SRC_URI="
	https://downloads.sourceforge.net/project/crcmod/crcmod/${P}/${P}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS=( changelog test/examples.py )

python_test() {
	"${EPYTHON}" test/test_crcmod.py -v || die "Tests fail with ${EPYTHON}"
}
