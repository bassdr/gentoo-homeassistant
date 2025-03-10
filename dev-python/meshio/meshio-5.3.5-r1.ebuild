# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/meshio/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="all"
IUSE="${GENERATED_IUSE} hdf5 netcdf"

REQUIRES_DIST="
	h5py ; extra == 'all'
	importlib-metadata ; python_version < '3.8'
	netCDF4 ; extra == 'all'
	numpy >=1.20.0
	rich
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( dev-python/h5py[${PYTHON_USEDEP}] )
	all? ( dev-python/netcdf4[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.20.0[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/numpy-1.20.0[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	hdf5? ( dev-python/h5py[${PYTHON_USEDEP}] )
	netcdf? ( dev-python/netcdf4[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? ( dev-python/h5py[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest
