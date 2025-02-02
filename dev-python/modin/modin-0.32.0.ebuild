# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all consortium-standard dask mpi ray spreadsheet"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/modin/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	all? ( >=dev-python/dask-2.22.0[${PYTHON_USEDEP}] )
	dask? ( >=dev-python/dask-2.22.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/dataframe-api-compat-0.2.7[${PYTHON_USEDEP}] )
	consortium-standard? ( >=dev-python/dataframe-api-compat-0.2.7[${PYTHON_USEDEP}] )
	all? ( >=dev-python/distributed-2.22.0[${PYTHON_USEDEP}] )
	dask? ( >=dev-python/distributed-2.22.0[${PYTHON_USEDEP}] )
	>=dev-python/fsspec-2022.11.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/modin-spreadsheet-0.1.0[${PYTHON_USEDEP}] )
	spreadsheet? ( >=dev-python/modin-spreadsheet-0.1.0[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.22.4[${PYTHON_USEDEP}]
	>=dev-python/packaging-21.0[${PYTHON_USEDEP}]
	<dev-python/pandas-2.3[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.8.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/pyarrow-10.0.1[${PYTHON_USEDEP}] )
	ray? ( >=dev-python/pyarrow-10.0.1[${PYTHON_USEDEP}] )
	all? ( !=dev-python/ray-2.5.0[${PYTHON_USEDEP}] )
	ray? ( !=dev-python/ray-2.5.0[${PYTHON_USEDEP}] )
	mpi? ( >=dev-python/unidist-0.2.1[mpi,${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
