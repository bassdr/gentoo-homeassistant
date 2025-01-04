# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="Python Serial Port Extension"
HOMEPAGE="
  https://pypi.org/project/pyserial/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="examples"

DOCS=( CHANGES.rst README.rst )

PATCHES=(
	"${FILESDIR}/${P}-unittest-fix.patch"
)

distutils_enable_sphinx documentation --no-autodoc

python_test() {
	"${EPYTHON}" test/run_all_tests.py loop:// -v ||
		die "Testing failed with ${EPYTHON}"
}

python_install_all() {
	distutils-r1_python_install_all
	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
}