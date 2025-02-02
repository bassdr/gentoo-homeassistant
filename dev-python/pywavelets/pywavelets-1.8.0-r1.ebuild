# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=meson-python
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/PyWavelets/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="optional"
IUSE="${GENERATED_IUSE} examples"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/numpy-3[${PYTHON_USEDEP}]
	optional? ( >=dev-python/scipy-1.9[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/matplotlib[${PYTHON_USEDEP}]
	<dev-python/numpy-3[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.22.4[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
	>=dev-python/cython-3.0.4[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_test() {
	rm -rf pywt || die
	epytest --pyargs pywt
}

python_install_all() {
	distutils-r1_python_install_all
	if use examples; then
		docinto examples
		dodoc -r demo
		docompress -x /usr/share/doc/${PF}/examples
	fi
}
