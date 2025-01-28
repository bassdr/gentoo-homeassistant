# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_EXT=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/llvmlite/"

LICENSE="BSD"
SLOT="0/0.44.0"
KEYWORDS="amd64 arm64"

BDEPEND="llvm-core/llvm:15"
RDEPEND="${BDEPEND}"
DEPEND="${RDEPEND}"

python_compile() {
	export "LLVM_CONFIG=${EPREFIX}/usr/lib/llvm/15/bin/llvm-config"
	distutils-r1_python_compile
}

distutils_enable_tests pytest
