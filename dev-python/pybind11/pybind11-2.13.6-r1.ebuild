# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit cmake distutils-r1

DESCRIPTION="Seamless operability between C++11 and Python"
HOMEPAGE="
  https://pypi.org/project/pybind11/
  Documentation, https://pybind11.readthedocs.io/
  Bug Tracker, https://github.com/pybind/pybind11/issues
  Discussions, https://github.com/pybind/pybind11/discussions
  Changelog, https://pybind11.readthedocs.io/en/latest/changelog.html
  Chat, https://gitter.im/pybind/Lobby
"
SRC_URI="
	https://github.com/pybind/pybind11/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="global"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	pybind11-global==2.13.6; extra == 'global'
"
GENERATED_RDEPEND="${RDEPEND}
	global? ( ~dev-python/pybind11-global-2.13.6[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-cpp/eigen:3
"
BDEPEND="
	test? (
		<dev-cpp/catch-3:0
		>=dev-cpp/catch-2.13.9:0
		dev-libs/boost
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

python_prepare_all() {
	cmake_src_prepare
	distutils-r1_python_prepare_all
}

python_configure() {
	local mycmakeargs=(
		# disable forced lto
		-DHAS_FLTO=OFF
		# https://github.com/pybind/pybind11/issues/5087
		-DPYBIND11_FINDPYTHON=OFF
		-DPYBIND11_INSTALL=ON
		-DPYBIND11_TEST=$(usex test)
	)
	cmake_src_configure
}

python_compile() {
	distutils-r1_python_compile
	# Compilation only does anything for tests
	use test && cmake_src_compile
}

python_test() {
	cmake_build cpptest test_cmake_build

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	cd "${BUILD_DIR}/tests" || die
	epytest -p rerunfailures --reruns=5 "${S}/tests"
}

python_install() {
	distutils-r1_python_install
	cmake_src_install
}
