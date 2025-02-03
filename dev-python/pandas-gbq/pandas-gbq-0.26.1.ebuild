# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="bqstorage geopandas tqdm"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pandas-gbq/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	<dev-python/db-dtypes-2.0.0[${PYTHON_USEDEP}]
	geopandas? ( >=dev-python/geopandas-0.9.0[${PYTHON_USEDEP}] )
	<dev-python/google-api-core-3.0.0_pre[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.13.0[${PYTHON_USEDEP}]
	>=dev-python/google-auth-oauthlib-0.7.0[${PYTHON_USEDEP}]
	<dev-python/google-cloud-bigquery-4.0.0_pre[${PYTHON_USEDEP}]
	bqstorage? ( <dev-python/google-cloud-bigquery-storage-3.0.0_pre[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.18.1[${PYTHON_USEDEP}]
	>=dev-python/packaging-22.0.0[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.1.4[${PYTHON_USEDEP}]
	>=dev-python/pyarrow-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydata-google-auth-1.5.0[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	geopandas? ( >=dev-python/shapely-1.8.4[${PYTHON_USEDEP}] )
	tqdm? ( >=dev-python/tqdm-4.23.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
