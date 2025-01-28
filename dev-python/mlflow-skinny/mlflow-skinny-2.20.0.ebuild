# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="aliyun-oss databricks extras gateway genai jfrog langchain mlserver sqlserver xethub"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mlflow-skinny/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	gateway? ( <dev-python/aiohttp-4[${PYTHON_USEDEP}] )
	genai? ( <dev-python/aiohttp-4[${PYTHON_USEDEP}] )
	aliyun-oss? ( dev-python/aliyunstoreplugin[${PYTHON_USEDEP}] )
	databricks? ( >dev-python/azure-storage-file-datalake-12[${PYTHON_USEDEP}] )
	extras? ( >=dev-python/azureml-core-1.2.0[${PYTHON_USEDEP}] )
	databricks? ( >dev-python/boto3-1[${PYTHON_USEDEP}] )
	extras? ( dev-python/boto3[${PYTHON_USEDEP}] )
	gateway? ( <dev-python/boto3-2[${PYTHON_USEDEP}] )
	genai? ( <dev-python/boto3-2[${PYTHON_USEDEP}] )
	databricks? ( dev-python/botocore[${PYTHON_USEDEP}] )
	extras? ( dev-python/botocore[${PYTHON_USEDEP}] )
	<dev-python/cachetools-6[${PYTHON_USEDEP}]
	<dev-python/click-9[${PYTHON_USEDEP}]
	<dev-python/cloudpickle-4[${PYTHON_USEDEP}]
	<dev-python/databricks-sdk-1[${PYTHON_USEDEP}]
	gateway? ( <dev-python/fastapi-1[${PYTHON_USEDEP}] )
	genai? ( <dev-python/fastapi-1[${PYTHON_USEDEP}] )
	<dev-python/gitpython-4[${PYTHON_USEDEP}]
	databricks? ( >=dev-python/google-cloud-storage-1.30.0[${PYTHON_USEDEP}] )
	extras? ( >=dev-python/google-cloud-storage-1.30.0[${PYTHON_USEDEP}] )
	!=dev-python/importlib-metadata-4.7.0[${PYTHON_USEDEP}]
	extras? ( dev-python/kubernetes[${PYTHON_USEDEP}] )
	langchain? ( <=dev-python/langchain-0.3.14[${PYTHON_USEDEP}] )
	sqlserver? ( dev-python/mlflow-dbstore[${PYTHON_USEDEP}] )
	jfrog? ( dev-python/mlflow-jfrog-plugin[${PYTHON_USEDEP}] )
	xethub? ( dev-python/mlflow-xethub[${PYTHON_USEDEP}] )
	mlserver? ( !=dev-python/mlserver-1.3.1[${PYTHON_USEDEP}] )
	mlserver? ( !=dev-python/mlserver-mlflow-1.3.1[${PYTHON_USEDEP}] )
	<dev-python/opentelemetry-api-3[${PYTHON_USEDEP}]
	<dev-python/opentelemetry-sdk-3[${PYTHON_USEDEP}]
	<dev-python/packaging-25[${PYTHON_USEDEP}]
	extras? ( dev-python/prometheus-flask-exporter[${PYTHON_USEDEP}] )
	<dev-python/protobuf-6[${PYTHON_USEDEP}]
	extras? ( dev-python/pyarrow[${PYTHON_USEDEP}] )
	<dev-python/pydantic-3[${PYTHON_USEDEP}]
	extras? ( dev-python/pysftp[${PYTHON_USEDEP}] )
	<dev-python/pyyaml-7[${PYTHON_USEDEP}]
	<dev-python/requests-3[${PYTHON_USEDEP}]
	extras? ( dev-python/requests-auth-aws-sigv4[${PYTHON_USEDEP}] )
	gateway? ( <dev-python/slowapi-1[${PYTHON_USEDEP}] )
	genai? ( <dev-python/slowapi-1[${PYTHON_USEDEP}] )
	<dev-python/sqlparse-1[${PYTHON_USEDEP}]
	gateway? ( <dev-python/tiktoken-1[${PYTHON_USEDEP}] )
	genai? ( <dev-python/tiktoken-1[${PYTHON_USEDEP}] )
	<dev-python/typing-extensions-5[${PYTHON_USEDEP}]
	gateway? ( <dev-python/uvicorn-1[standard,${PYTHON_USEDEP}] )
	genai? ( <dev-python/uvicorn-1[standard,${PYTHON_USEDEP}] )
	extras? ( dev-python/virtualenv[${PYTHON_USEDEP}] )
	gateway? ( <dev-python/watchfiles-2[${PYTHON_USEDEP}] )
	genai? ( <dev-python/watchfiles-2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest