# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/rapidfuzz/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

# all these are header-only libraries
GENERATED_IUSE="all"
IUSE="${GENERATED_IUSE}"
DEPEND="
	>=dev-cpp/taskflow-3.0.0
	>=dev-cpp/rapidfuzz-cpp-3.2.0
	dev-python/numpy[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/cython-3[${PYTHON_USEDEP}]
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

src_prepare() {
	# sterilize build flags
	sed -i -e '/CMAKE_INTERPROCEDURAL_OPTIMIZATION/d' CMakeLists.txt || die
	# remove bundled libraries
	rm -r extern || die
	# force recythonization
	find src -name '*.cxx' -delete || die
	# do not require exact taskflow version
	sed -i -e '/Taskflow/s:3\.8\.0::' CMakeLists.txt || die
	# https://github.com/scikit-build/scikit-build-core/issues/912
	sed -i -e '/scikit-build-core/s:0\.10:0.8:' pyproject.toml || die

	distutils-r1_src_prepare

	export RAPIDFUZZ_BUILD_EXTENSION=1
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
