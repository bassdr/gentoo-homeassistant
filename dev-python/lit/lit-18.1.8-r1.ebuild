# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 llvm.org

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/lit/"

LICENSE="Apache-2.0-with-LLVM-exceptions UoI-NCSA"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

# Tests require 'FileCheck' and 'not' utilities (from llvm)
BDEPEND="
	test? (
		dev-python/psutil[${PYTHON_USEDEP}]
		llvm-core/llvm
	)
"

LLVM_COMPONENTS=( llvm/utils/lit )
llvm.org_set_globals

# TODO: move the manpage generation here (from llvm-core/llvm)

src_prepare() {
	# flaky test
	# https://github.com/llvm/llvm-project/issues/72022
	rm tests/progress-bar.py || die

	cd "${WORKDIR}" || die
	distutils-r1_src_prepare
}

python_test() {
	local -x LIT_PRESERVES_TMP=1
	local litflags=$(get_lit_flags)
	./lit.py ${litflags//;/ } tests || die
}
