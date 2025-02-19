# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Physical quantities module"
HOMEPAGE="
  https://pypi.org/project/pint/
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
REQUIRES_DIST="
	babel<=2.8; extra == 'babel'
	dask; extra == 'dask'
	flexcache>=0.3
	flexparser>=0.4
	mip>=1.13; extra == 'mip'
	numpy>=1.23; extra == 'numpy'
	pint-pandas>=0.3; extra == 'pandas'
	platformdirs>=2.1.0
	pytest-benchmark; extra == 'test'
	pytest-benchmark; extra == 'testbase'
	pytest-codspeed; extra == 'bench'
	pytest-cov; extra == 'test'
	pytest-cov; extra == 'testbase'
	pytest-mpl; extra == 'test'
	pytest-subtests; extra == 'test'
	pytest-subtests; extra == 'testbase'
	pytest; extra == 'bench'
	pytest; extra == 'test'
	pytest; extra == 'testbase'
	typing-extensions>=4.0.0
	uncertainties>=3.1.6; extra == 'uncertainties'
	xarray; extra == 'xarray'
"
GENERATED_RDEPEND="${RDEPEND}
	babel? ( <=dev-python/babel-2.8[${PYTHON_USEDEP}] )
	dask? ( dev-python/dask[${PYTHON_USEDEP}] )
	>=dev-python/flexcache-0.3[${PYTHON_USEDEP}]
	>=dev-python/flexparser-0.4[${PYTHON_USEDEP}]
	mip? ( >=dev-python/mip-1.13[${PYTHON_USEDEP}] )
	numpy? ( >=dev-python/numpy-1.23[${PYTHON_USEDEP}] )
	pandas? ( >=dev-python/pint-pandas-0.3[${PYTHON_USEDEP}] )
	>=dev-python/platformdirs-2.1.0[${PYTHON_USEDEP}]
	bench? ( dev-python/pytest[${PYTHON_USEDEP}] )
	testbase? ( dev-python/pytest[${PYTHON_USEDEP}] )
	testbase? ( dev-python/pytest-benchmark[${PYTHON_USEDEP}] )
	bench? ( dev-python/pytest-codspeed[${PYTHON_USEDEP}] )
	testbase? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	testbase? ( dev-python/pytest-subtests[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	uncertainties? ( >=dev-python/uncertainties-3.1.6[${PYTHON_USEDEP}] )
	xarray? ( dev-python/xarray[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-benchmark[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mpl[${PYTHON_USEDEP}]
		dev-python/pytest-subtests[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
