# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyscard/"
SRC_URI="
	https://downloads.sourceforge.net/project/pyscard/pyscard/pyscard%20${PV}/${P}.tar.gz
"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="gui"
IUSE="${GENERATED_IUSE}"
DEPEND="
	sys-apps/pcsc-lite
"
GENERATED_RDEPEND="${RDEPEND}
	gui? ( dev-python/wxpython[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	${DEPEND}
"
BDEPEND="
	dev-lang/swig
"

distutils_enable_tests pytest

pkg_postinst() {
	optfeature "Gui support" dev-python/wxpython
	optfeature "Support of remote readers with Pyro" dev-python/Pyro4
}
