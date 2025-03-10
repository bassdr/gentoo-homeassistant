# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyproj/"
SRC_URI="
	https://github.com/pyproj4/pyproj/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

DEPEND="
	>=sci-libs/proj-9.0.0:=
"
REQUIRES_DIST="
	certifi
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/certifi[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/certifi[${PYTHON_USEDEP}]
	${DEPEND}
"
BDEPEND="
	>=dev-python/cython-3[${PYTHON_USEDEP}]
	test? (
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/shapely[${PYTHON_USEDEP}]
		dev-python/xarray[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_configure() {
	# Avoid greedily trying -L/usr/lib, etc
	# https://github.com/pyproj4/pyproj/blob/main/setup.py#L76
	export PROJ_LIBDIR="${ESYSROOT}/usr/$(get_libdir)"
	export PROJ_INCDIR="${ESYSROOT}/usr/include"
}

python_test() {
	rm -rf pyproj || die
	epytest -m "not network" test
}
