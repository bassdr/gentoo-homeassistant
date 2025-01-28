# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
DISTUTILS_USE_PEP517=setuptools
PYPI_PN="Pint"
inherit distutils-r1 pypi

DESCRIPTION="Physical quantities module"
HOMEPAGE="
  https://pypi.org/project/Pint/
  Homepage, https://github.com/hgrecco/pint
  Documentation, https://pint.readthedocs.io/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="babel bench dask mip numpy pandas test testbase uncertainties xarray"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	babel? ( <=dev-python/babel-2.8[${PYTHON_USEDEP}] )
	dask? ( dev-python/dask[${PYTHON_USEDEP}] )
	>=dev-python/flexcache-0.3[${PYTHON_USEDEP}]
	dev-python/flexcache[${PYTHON_USEDEP}]
	>=dev-python/flexparser-0.4[${PYTHON_USEDEP}]
	dev-python/flexparser[${PYTHON_USEDEP}]
	mip? ( >=dev-python/mip-1.13[${PYTHON_USEDEP}] )
	numpy? ( >=dev-python/numpy-1.23[${PYTHON_USEDEP}] )
	pandas? ( >=dev-python/pint-pandas-0.3[${PYTHON_USEDEP}] )
	>=dev-python/platformdirs-2.1.0[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	bench? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	testbase? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-benchmark[${PYTHON_USEDEP}] )
	testbase? ( dev-python/pytest-benchmark[${PYTHON_USEDEP}] )
	bench? ( dev-python/pytest-codspeed[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	testbase? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-mpl[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-subtests[${PYTHON_USEDEP}] )
	testbase? ( dev-python/pytest-subtests[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	uncertainties? ( >=dev-python/uncertainties-3.1.6[${PYTHON_USEDEP}] )
	xarray? ( dev-python/xarray[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
# RDEPEND could not be inserted in this ebuild
