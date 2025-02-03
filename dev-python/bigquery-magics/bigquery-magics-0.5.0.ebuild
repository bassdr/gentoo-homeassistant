# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all bigframes bqstorage"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/bigquery-magics/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	all? ( >=dev-python/bigframes-1.17.0[${PYTHON_USEDEP}] )
	bigframes? ( >=dev-python/bigframes-1.17.0[${PYTHON_USEDEP}] )
	<dev-python/db-dtypes-2.0.0_pre[${PYTHON_USEDEP}]
	<dev-python/google-cloud-bigquery-4.0.0_pre[${PYTHON_USEDEP}]
	all? ( <dev-python/google-cloud-bigquery-storage-3.0.0_pre[${PYTHON_USEDEP}] )
	bqstorage? ( <dev-python/google-cloud-bigquery-storage-3.0.0_pre[${PYTHON_USEDEP}] )
	<dev-python/grpcio-2.0_pre[${PYTHON_USEDEP}]
	all? ( <dev-python/grpcio-2.0_pre[${PYTHON_USEDEP}] )
	bqstorage? ( <dev-python/grpcio-2.0_pre[${PYTHON_USEDEP}] )
	>=dev-python/ipykernel-5.5.6[${PYTHON_USEDEP}]
	>=dev-python/ipython-7.23.1[${PYTHON_USEDEP}]
	>=dev-python/ipywidgets-7.7.1[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0.0[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/pyarrow-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydata-google-auth-1.5.0[${PYTHON_USEDEP}]
	<dev-python/tqdm-5.0.0_pre[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
