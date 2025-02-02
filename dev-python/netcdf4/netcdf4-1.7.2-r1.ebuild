# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/netCDF4/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="blosc bzip2 mpi test szip zstd"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="${RDEPEND}
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/cftime[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
"
DEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	sci-libs/hdf5:=
	sci-libs/netcdf:=[blosc(-)=,bzip2(-)=,hdf5,mpi=,szip=,zstd(-)=]
"
RDEPEND="${GENERATED_DEPEND}
	${DEPEND}
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/cftime[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	test? (
		${RDEPEND}
		dev-python/packaging[${PYTHON_USEDEP}]
		sci-libs/netcdf[tools(+)]
	)
"

python_test() {
	local -x NO_NET=1
	cd test || die
	"${EPYTHON}" run_all.py || die
}

pkg_postinst() {
	optfeature "HDF4 support" sci-libs/hdf "sci-libs/netcdf[hdf]"
	optfeature "OPeNDAP support" net-misc/curl "sci-libs/netcdf[dap]"
}
# BDEPEND could not be inserted in this ebuild
