# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all feature-processor huggingface local sagemaker-mlflow scipy test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sagemaker/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	all? ( <=dev-python/accelerate-0.27.0[${PYTHON_USEDEP}] )
	huggingface? ( <=dev-python/accelerate-0.27.0[${PYTHON_USEDEP}] )
	test? ( <=dev-python/accelerate-0.27.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/apache-airflow-2.9.3[${PYTHON_USEDEP}] )
	test? ( ~dev-python/apache-airflow-providers-amazon-7.2.1[${PYTHON_USEDEP}] )
	<dev-python/attrs-24[${PYTHON_USEDEP}]
	test? ( <dev-python/attrs-24[${PYTHON_USEDEP}] )
	test? ( ~dev-python/awslogs-0.14.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/black-24.3.0[${PYTHON_USEDEP}] )
	<dev-python/boto3-2.0[${PYTHON_USEDEP}]
	test? ( ~dev-python/build-1.2.1[virtualenv,${PYTHON_USEDEP}] )
	>=dev-python/cloudpickle-2.2.1[${PYTHON_USEDEP}]
	test? ( ~dev-python/cloudpickle-2.2.1[${PYTHON_USEDEP}] )
	test? ( ~dev-python/contextlib2-21.6.0[${PYTHON_USEDEP}] )
	test? ( <dev-python/coverage-6.2[${PYTHON_USEDEP}] )
	test? ( >=dev-python/deepdiff-8.0.0[${PYTHON_USEDEP}] )
	all? ( <dev-python/docker-8.0.0[${PYTHON_USEDEP}] )
	dev-python/docker[${PYTHON_USEDEP}]
	local? ( <dev-python/docker-8.0.0[${PYTHON_USEDEP}] )
	test? ( <dev-python/docker-8.0.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/fabric-2.6.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/fastapi-0.111.0[${PYTHON_USEDEP}] )
	dev-python/fastapi[${PYTHON_USEDEP}]
	huggingface? ( >=dev-python/fastapi-0.111.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/fastapi-0.111.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/fastapi-0.115.4[${PYTHON_USEDEP}] )
	test? ( ~dev-python/flake8-4.0.1[${PYTHON_USEDEP}] )
	dev-python/google-pasta[${PYTHON_USEDEP}]
	test? ( ~dev-python/huggingface-hub-0.26.2[${PYTHON_USEDEP}] )
	<dev-python/importlib-metadata-7.0[${PYTHON_USEDEP}]
	test? ( ~dev-python/jinja2-3.1.4[${PYTHON_USEDEP}] )
	test? ( <dev-python/jsonpickle-4.0.0[${PYTHON_USEDEP}] )
	dev-python/jsonschema[${PYTHON_USEDEP}]
	test? ( <dev-python/mlflow-2.13[${PYTHON_USEDEP}] )
	test? ( ~dev-python/mock-4.0.3[${PYTHON_USEDEP}] )
	test? ( <dev-python/nbformat-6[${PYTHON_USEDEP}] )
	all? ( dev-python/nest-asyncio[${PYTHON_USEDEP}] )
	huggingface? ( dev-python/nest-asyncio[${PYTHON_USEDEP}] )
	test? ( dev-python/nest-asyncio[${PYTHON_USEDEP}] )
	<dev-python/numpy-2.0[${PYTHON_USEDEP}]
	test? ( >=dev-python/numpy-1.24.0[${PYTHON_USEDEP}] )
	<dev-python/omegaconf-2.3[${PYTHON_USEDEP}]
	test? ( ~dev-python/onnx-1.17.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/opentelemetry-proto-1.27.0[${PYTHON_USEDEP}] )
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	test? ( ~dev-python/pandas-1.4.4[${PYTHON_USEDEP}] )
	dev-python/pathos[${PYTHON_USEDEP}]
	test? ( <=dev-python/pillow-11[${PYTHON_USEDEP}] )
	dev-python/platformdirs[${PYTHON_USEDEP}]
	<dev-python/protobuf-6.0[${PYTHON_USEDEP}]
	test? ( ~dev-python/protobuf-4.25.5[${PYTHON_USEDEP}] )
	dev-python/psutil[${PYTHON_USEDEP}]
	all? ( ~dev-python/pyspark-3.3.2[${PYTHON_USEDEP}] )
	feature-processor? ( ~dev-python/pyspark-3.3.2[${PYTHON_USEDEP}] )
	test? ( ~dev-python/pyspark-3.3.2[${PYTHON_USEDEP}] )
	test? ( ~dev-python/pytest-6.2.5[${PYTHON_USEDEP}] )
	test? ( ~dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/pytest-rerunfailures-10.2[${PYTHON_USEDEP}] )
	test? ( ~dev-python/pytest-timeout-2.1.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/pytest-xdist-2.4.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/pyvis-0.2.1[${PYTHON_USEDEP}] )
	all? ( <dev-python/pyyaml-7[${PYTHON_USEDEP}] )
	local? ( <dev-python/pyyaml-7[${PYTHON_USEDEP}] )
	test? ( <dev-python/pyyaml-7[${PYTHON_USEDEP}] )
	test? ( ~dev-python/pyyaml-6.0[${PYTHON_USEDEP}] )
	~dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	test? ( ~dev-python/requests-2.32.2[${PYTHON_USEDEP}] )
	<dev-python/sagemaker-core-2.0.0[${PYTHON_USEDEP}]
	test? ( ~dev-python/sagemaker-experiments-0.1.35[${PYTHON_USEDEP}] )
	all? ( dev-python/sagemaker-feature-store-pyspark-3_3[${PYTHON_USEDEP}] )
	feature-processor? ( dev-python/sagemaker-feature-store-pyspark-3_3[${PYTHON_USEDEP}] )
	test? ( dev-python/sagemaker-feature-store-pyspark-3_3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sagemaker-mlflow-0.1.0[${PYTHON_USEDEP}] )
	sagemaker-mlflow? ( >=dev-python/sagemaker-mlflow-0.1.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/sagemaker-mlflow-0.1.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sagemaker-schema-inference-artifacts-0.0.5[${PYTHON_USEDEP}] )
	huggingface? ( >=dev-python/sagemaker-schema-inference-artifacts-0.0.5[${PYTHON_USEDEP}] )
	test? ( >=dev-python/sagemaker-schema-inference-artifacts-0.0.5[${PYTHON_USEDEP}] )
	dev-python/schema[${PYTHON_USEDEP}]
	test? ( ~dev-python/schema-0.7.5[${PYTHON_USEDEP}] )
	test? ( ~dev-python/scikit-learn-1.3.0[${PYTHON_USEDEP}] )
	all? ( ~dev-python/scipy-1.10.1[${PYTHON_USEDEP}] )
	scipy? ( ~dev-python/scipy-1.10.1[${PYTHON_USEDEP}] )
	test? ( ~dev-python/scipy-1.10.1[${PYTHON_USEDEP}] )
	~dev-python/smdebug-rulesconfig-1.0.1[${PYTHON_USEDEP}]
	test? ( ~dev-python/stopit-1.1.2[${PYTHON_USEDEP}] )
	<dev-python/tblib-4[${PYTHON_USEDEP}]
	test? ( <=dev-python/tensorboard-2.15.2[${PYTHON_USEDEP}] )
	test? ( <=dev-python/tensorflow-2.15.1[${PYTHON_USEDEP}] )
	test? ( ~dev-python/tox-3.24.5[${PYTHON_USEDEP}] )
	dev-python/tqdm[${PYTHON_USEDEP}]
	test? ( <dev-python/tritonclient-2.37.0[http,${PYTHON_USEDEP}] )
	<dev-python/urllib3-3.0.0[${PYTHON_USEDEP}]
	all? ( <dev-python/urllib3-3.0.0[${PYTHON_USEDEP}] )
	local? ( <dev-python/urllib3-3.0.0[${PYTHON_USEDEP}] )
	test? ( <dev-python/urllib3-3.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/uvicorn-0.30.1[${PYTHON_USEDEP}] )
	dev-python/uvicorn[${PYTHON_USEDEP}]
	huggingface? ( >=dev-python/uvicorn-0.30.1[${PYTHON_USEDEP}] )
	test? ( >=dev-python/uvicorn-0.30.1[${PYTHON_USEDEP}] )
	test? ( <=dev-python/xgboost-1.7.6[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest