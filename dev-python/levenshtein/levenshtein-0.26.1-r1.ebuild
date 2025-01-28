# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=${P^}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/levenshtein/"
SRC_URI="
	https://github.com/rapidfuzz/Levenshtein/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	<dev-python/rapidfuzz-4.0.0[${PYTHON_USEDEP}]
"
DEPEND="
	<dev-cpp/rapidfuzz-cpp-4
	>=dev-cpp/rapidfuzz-cpp-3.0.0
"
RDEPEND="
	<dev-python/rapidfuzz-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/rapidfuzz-3.9.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/cython-3.0.11[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_prepare() {
	# sterilize build flags
	sed -i -e '/CMAKE_INTERPROCEDURAL_OPTIMIZATION/d' CMakeLists.txt || die

	distutils-r1_src_prepare
}
