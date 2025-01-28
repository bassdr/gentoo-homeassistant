# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="ncurses"

inherit distutils-r1 optfeature pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/urwid/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="glib lcd serial tornado trio twisted zmq"
IUSE="${GENERATED_IUSE} examples"

GENERATED_DEPEND="
	trio? ( dev-python/exceptiongroup[${PYTHON_USEDEP}] )
	glib? ( dev-python/pygobject[${PYTHON_USEDEP}] )
	lcd? ( dev-python/pyserial[${PYTHON_USEDEP}] )
	serial? ( dev-python/pyserial[${PYTHON_USEDEP}] )
	tornado? ( >=dev-python/tornado-5.0[${PYTHON_USEDEP}] )
	trio? ( >=dev-python/trio-0.22.0[${PYTHON_USEDEP}] )
	twisted? ( dev-python/twisted[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/wcwidth[${PYTHON_USEDEP}]
	dev-python/windows-curses[${PYTHON_USEDEP}]
	zmq? ( dev-python/zmq[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/wcwidth[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest

python_install_all() {
	use examples && dodoc -r examples
	distutils-r1_python_install_all
}

pkg_postinst() {
	optfeature "Trio event loop" "dev-python/trio"
}
