# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

# upstream doesn't do tags
EGIT_COMMIT="674a77b5eaf850d063f518bd90c243ee34ad6b5d"

DESCRIPTION="A QR code generator written purely in Python with SVG, EPS, PNG and terminal output."
HOMEPAGE="
  https://pypi.org/project/pyqrcode/
"
SRC_URI="https://github.com/mnooner256/pyqrcode/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S=${WORKDIR}/${PN}-${EGIT_COMMIT}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="png test"
RESTRICT="!test? ( test )"

RDEPEND="png? ( dev-python/pypng[${PYTHON_USEDEP}] )"
BDEPEND="
	test? ( dev-python/pypng[${PYTHON_USEDEP}] )
"

src_prepare() {
	# don't pull in tkinter for one test
	sed -i -e 's:test_xbm_with_tkinter:_&:' \
		tests/test_xbm.py || die

	distutils-r1_src_prepare
}

