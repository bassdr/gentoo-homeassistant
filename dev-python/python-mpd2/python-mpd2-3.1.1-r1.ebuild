# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="A Python MPD client library"
HOMEPAGE="
  https://pypi.org/project/python-mpd2/
"
# as of 3.1.0, sdist is missing some doc files
SRC_URI="
	https://github.com/Mic92/python-mpd2/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="twisted"
IUSE="${GENERATED_IUSE} examples +twisted"

REQUIRES_DIST="
	Twisted ; extra == 'twisted'
"
GENERATED_RDEPEND="${RDEPEND}
	twisted? ( dev-python/twisted[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	twisted? ( dev-python/twisted[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/twisted[${PYTHON_USEDEP}]
	)
"

DOCS=( README.rst doc/{changes.rst,commands_header.txt} doc/topics/. )

distutils_enable_sphinx doc --no-autodoc
distutils_enable_tests unittest

python_test() {
	eunittest mpd.tests
}

python_install_all() {
	distutils-r1_python_install_all

	use examples && dodoc -r examples/.
}
