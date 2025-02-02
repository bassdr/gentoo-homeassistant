# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="aliyun-oss databricks extras gateway genai jfrog langchain mlserver sqlserver xethub"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mlflow/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	gateway? ( <dev-python/aiohttp-4[${PYTHON_USEDEP}] )
	genai? ( <dev-python/aiohttp-4[${PYTHON_USEDEP}] )
	!=dev-python/alembic-1.10.0[${PYTHON_USEDEP}]
	aliyun-oss? ( dev-python/aliyunstoreplugin[${PYTHON_USEDEP}] )
	databricks? ( >dev-python/azure-storage-file-datalake-12[${PYTHON_USEDEP}] )
	extras? ( >=dev-python/azureml-core-1.2.0[${PYTHON_USEDEP}] )
	databricks? ( >dev-python/boto3-1[${PYTHON_USEDEP}] )
	extras? ( dev-python/boto3[${PYTHON_USEDEP}] )
	gateway? ( <dev-python/boto3-2[${PYTHON_USEDEP}] )
	genai? ( <dev-python/boto3-2[${PYTHON_USEDEP}] )
	databricks? ( dev-python/botocore[${PYTHON_USEDEP}] )
	extras? ( dev-python/botocore[${PYTHON_USEDEP}] )
	<dev-python/docker-8[${PYTHON_USEDEP}]
	gateway? ( <dev-python/fastapi-1[${PYTHON_USEDEP}] )
	genai? ( <dev-python/fastapi-1[${PYTHON_USEDEP}] )
	<dev-python/flask-4[${PYTHON_USEDEP}]
	databricks? ( >=dev-python/google-cloud-storage-1.30.0[${PYTHON_USEDEP}] )
	extras? ( >=dev-python/google-cloud-storage-1.30.0[${PYTHON_USEDEP}] )
	<dev-python/graphene-4[${PYTHON_USEDEP}]
	extras? ( dev-python/kubernetes[${PYTHON_USEDEP}] )
	langchain? ( <=dev-python/langchain-0.3.14[${PYTHON_USEDEP}] )
	<dev-python/markdown-4[${PYTHON_USEDEP}]
	<dev-python/matplotlib-4[${PYTHON_USEDEP}]
	sqlserver? ( dev-python/mlflow-dbstore[${PYTHON_USEDEP}] )
	jfrog? ( dev-python/mlflow-jfrog-plugin[${PYTHON_USEDEP}] )
	~dev-python/mlflow-skinny-2.20.1[${PYTHON_USEDEP}]
	xethub? ( dev-python/mlflow-xethub[${PYTHON_USEDEP}] )
	mlserver? ( !=dev-python/mlserver-1.3.1[${PYTHON_USEDEP}] )
	mlserver? ( !=dev-python/mlserver-mlflow-1.3.1[${PYTHON_USEDEP}] )
	<dev-python/numpy-3[${PYTHON_USEDEP}]
	<dev-python/pandas-3[${PYTHON_USEDEP}]
	extras? ( dev-python/prometheus-flask-exporter[${PYTHON_USEDEP}] )
	<dev-python/pyarrow-19[${PYTHON_USEDEP}]
	extras? ( dev-python/pyarrow[${PYTHON_USEDEP}] )
	extras? ( dev-python/pysftp[${PYTHON_USEDEP}] )
	extras? ( dev-python/requests-auth-aws-sigv4[${PYTHON_USEDEP}] )
	<dev-python/scikit-learn-2[${PYTHON_USEDEP}]
	<dev-python/scipy-2[${PYTHON_USEDEP}]
	gateway? ( <dev-python/slowapi-1[${PYTHON_USEDEP}] )
	genai? ( <dev-python/slowapi-1[${PYTHON_USEDEP}] )
	<dev-python/sqlalchemy-3[${PYTHON_USEDEP}]
	gateway? ( <dev-python/tiktoken-1[${PYTHON_USEDEP}] )
	genai? ( <dev-python/tiktoken-1[${PYTHON_USEDEP}] )
	gateway? ( <dev-python/uvicorn-1[standard,${PYTHON_USEDEP}] )
	genai? ( <dev-python/uvicorn-1[standard,${PYTHON_USEDEP}] )
	extras? ( dev-python/virtualenv[${PYTHON_USEDEP}] )
	gateway? ( <dev-python/watchfiles-2[${PYTHON_USEDEP}] )
	genai? ( <dev-python/watchfiles-2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
