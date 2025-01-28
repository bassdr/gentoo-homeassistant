# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pygraphviz/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

# Note: only C API of graphviz is used, PYTHON_USEDEP unnecessary.
DEPEND="
	media-gfx/graphviz
"
RDEPEND="
	${DEPEND}
"
BDEPEND="
	dev-lang/swig:0
"

distutils_enable_tests pytest

src_configure() {
	swig -python pygraphviz/graphviz.i || die
}

python_test() {
	cd "${BUILD_DIR}"/install || die
	epytest
}

python_install_all() {
	dodoc -r examples
	docompress -x /usr/share/doc/${PF}/examples

	distutils-r1_python_install_all
}
