# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all bigquery-v2 bqstorage geopandas ipython ipywidgets opentelemetry pandas tqdm"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/google-cloud-bigquery/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	ipython? ( >=dev-python/bigquery-magics-0.1.0[${PYTHON_USEDEP}] )
	pandas? ( <dev-python/db-dtypes-2.0.0_pre[${PYTHON_USEDEP}] )
	geopandas? ( <dev-python/geopandas-2.0_pre[${PYTHON_USEDEP}] )
	<dev-python/google-api-core-3.0.0_pre[grpc,${PYTHON_USEDEP}]
	<dev-python/google-auth-3.0.0_pre[${PYTHON_USEDEP}]
	all? ( dev-python/google-cloud-bigquery[bigquery_v2,bqstorage,geopandas,ipython,ipywidgets,opentelemetry,pandas,tqdm,${PYTHON_USEDEP}] )
	bqstorage? ( <dev-python/google-cloud-bigquery-storage-3.0.0_pre[${PYTHON_USEDEP}] )
	<dev-python/google-cloud-core-3.0.0_pre[${PYTHON_USEDEP}]
	<dev-python/google-resumable-media-3.0_pre[${PYTHON_USEDEP}]
	<dev-python/grpcio-2.0_pre[${PYTHON_USEDEP}]
	bqstorage? ( <dev-python/grpcio-2.0_pre[${PYTHON_USEDEP}] )
	>=dev-python/importlib-metadata-1.0.0[${PYTHON_USEDEP}]
	ipywidgets? ( >=dev-python/ipykernel-6.0.0[${PYTHON_USEDEP}] )
	ipywidgets? ( >=dev-python/ipywidgets-7.7.0[${PYTHON_USEDEP}] )
	opentelemetry? ( >=dev-python/opentelemetry-api-1.1.0[${PYTHON_USEDEP}] )
	opentelemetry? ( >=dev-python/opentelemetry-instrumentation-0_beta0[${PYTHON_USEDEP}] )
	opentelemetry? ( >=dev-python/opentelemetry-sdk-1.1.0[${PYTHON_USEDEP}] )
	>=dev-python/packaging-20.0.0[${PYTHON_USEDEP}]
	pandas? ( >=dev-python/pandas-1.1.0[${PYTHON_USEDEP}] )
	bigquery-v2? ( <dev-python/proto-plus-2.0.0_pre[${PYTHON_USEDEP}] )
	bigquery-v2? ( !=dev-python/protobuf-4.21.0[${PYTHON_USEDEP}] )
	bqstorage? ( >=dev-python/pyarrow-3.0.0[${PYTHON_USEDEP}] )
	pandas? ( >=dev-python/pyarrow-3.0.0[${PYTHON_USEDEP}] )
	<dev-python/python-dateutil-3.0_pre[${PYTHON_USEDEP}]
	<dev-python/requests-3.0.0_pre[${PYTHON_USEDEP}]
	geopandas? ( <dev-python/shapely-3.0.0_pre[${PYTHON_USEDEP}] )
	tqdm? ( <dev-python/tqdm-5.0.0_pre[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
