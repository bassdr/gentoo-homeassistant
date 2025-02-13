# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 flag-o-matic pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/numba/"
IUSE="tbb"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/llvmlite-0.45[${PYTHON_USEDEP}]
	<dev-python/numpy-2.2[${PYTHON_USEDEP}]
"
DEPEND="tbb? ( <dev-cpp/tbb-2021.5.0-r1 )
	<dev-python/numpy-2.2.0[${PYTHON_USEDEP}]"
RDEPEND="${GENERATED_DEPEND} dev-python/llvmlite[${PYTHON_USEDEP}]
	dev-python/setuptools:0[${PYTHON_USEDEP}]"

src_configure() {
	append-ldflags "$(no-as-needed)"
	distutils-r1_src_configure
}

src_compile() {
	export MAKEOPTS=-j1
	! use tbb && export NUMBA_DISABLE_TBB=1
	distutils-r1_src_compile
}

distutils_enable_tests pytest
