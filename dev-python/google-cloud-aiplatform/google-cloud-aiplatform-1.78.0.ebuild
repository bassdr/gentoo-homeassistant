# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="autologging cloud-profiler endpoint evaluation full langchain langchain-testing lit metadata pipelines prediction private-endpoints ray ray-testing reasoningengine tensorboard testing tokenization vizier xai"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/google-cloud-aiplatform/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	langchain-testing? ( dev-python/absl-py[${PYTHON_USEDEP}] )
	testing? ( dev-python/aiohttp[${PYTHON_USEDEP}] )
	dev-python/bigframes[${PYTHON_USEDEP}]
	langchain-testing? ( <dev-python/cloudpickle-4.0[${PYTHON_USEDEP}] )
	reasoningengine? ( <dev-python/cloudpickle-4.0[${PYTHON_USEDEP}] )
	full? ( >=dev-python/docker-5.0.3[${PYTHON_USEDEP}] )
	prediction? ( >=dev-python/docker-5.0.3[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/docker-5.0.3[${PYTHON_USEDEP}] )
	<dev-python/docstring-parser-1[${PYTHON_USEDEP}]
	full? ( >=dev-python/explainable-ai-sdk-1.0.0[${PYTHON_USEDEP}] )
	lit? ( >=dev-python/explainable-ai-sdk-1.0.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/explainable-ai-sdk-1.0.0[${PYTHON_USEDEP}] )
	full? ( <=dev-python/fastapi-0.114.0[${PYTHON_USEDEP}] )
	prediction? ( <=dev-python/fastapi-0.114.0[${PYTHON_USEDEP}] )
	testing? ( <=dev-python/fastapi-0.114.0[${PYTHON_USEDEP}] )
	!=dev-python/google-api-core-2.0*[grpc,${PYTHON_USEDEP}]
	testing? ( <dev-python/google-api-core-3.0.0[${PYTHON_USEDEP}] )
	<dev-python/google-auth-3.0.0dev[${PYTHON_USEDEP}]
	!=dev-python/google-cloud-bigquery-3.20.0[${PYTHON_USEDEP}]
	full? ( dev-python/google-cloud-bigquery[${PYTHON_USEDEP}] )
	ray-testing? ( dev-python/google-cloud-bigquery[${PYTHON_USEDEP}] )
	ray? ( dev-python/google-cloud-bigquery[${PYTHON_USEDEP}] )
	testing? ( dev-python/google-cloud-bigquery[${PYTHON_USEDEP}] )
	full? ( dev-python/google-cloud-bigquery-storage[${PYTHON_USEDEP}] )
	ray-testing? ( dev-python/google-cloud-bigquery-storage[${PYTHON_USEDEP}] )
	ray? ( dev-python/google-cloud-bigquery-storage[${PYTHON_USEDEP}] )
	testing? ( dev-python/google-cloud-bigquery-storage[${PYTHON_USEDEP}] )
	<dev-python/google-cloud-resource-manager-3.0.0dev[${PYTHON_USEDEP}]
	<dev-python/google-cloud-storage-3.0.0dev[${PYTHON_USEDEP}]
	langchain-testing? ( <dev-python/google-cloud-trace-2[${PYTHON_USEDEP}] )
	reasoningengine? ( <dev-python/google-cloud-trace-2[${PYTHON_USEDEP}] )
	full? ( >=dev-python/google-vizier-0.1.6[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/google-vizier-0.1.6[${PYTHON_USEDEP}] )
	vizier? ( >=dev-python/google-vizier-0.1.6[${PYTHON_USEDEP}] )
	testing? ( dev-python/grpcio-testing[${PYTHON_USEDEP}] )
	full? ( <dev-python/httpx-0.25.0[${PYTHON_USEDEP}] )
	prediction? ( <dev-python/httpx-0.25.0[${PYTHON_USEDEP}] )
	testing? ( <dev-python/httpx-0.25.0[${PYTHON_USEDEP}] )
	full? ( dev-python/immutabledict[${PYTHON_USEDEP}] )
	ray-testing? ( dev-python/immutabledict[${PYTHON_USEDEP}] )
	ray? ( dev-python/immutabledict[${PYTHON_USEDEP}] )
	testing? ( dev-python/immutabledict[${PYTHON_USEDEP}] )
	testing? ( dev-python/ipython[${PYTHON_USEDEP}] )
	testing? ( <dev-python/kfp-3.0.0[${PYTHON_USEDEP}] )
	langchain-testing? ( <dev-python/langchain-0.4[${PYTHON_USEDEP}] )
	langchain? ( <dev-python/langchain-0.4[${PYTHON_USEDEP}] )
	langchain-testing? ( <dev-python/langchain-core-0.4[${PYTHON_USEDEP}] )
	langchain? ( <dev-python/langchain-core-0.4[${PYTHON_USEDEP}] )
	langchain-testing? ( <dev-python/langchain-google-vertexai-3[${PYTHON_USEDEP}] )
	langchain? ( <dev-python/langchain-google-vertexai-3[${PYTHON_USEDEP}] )
	langchain-testing? ( <dev-python/langgraph-0.3[${PYTHON_USEDEP}] )
	langchain? ( <dev-python/langgraph-0.3[${PYTHON_USEDEP}] )
	full? ( ~dev-python/lit-nlp-0.4.0[${PYTHON_USEDEP}] )
	lit? ( ~dev-python/lit-nlp-0.4.0[${PYTHON_USEDEP}] )
	testing? ( ~dev-python/lit-nlp-0.4.0[${PYTHON_USEDEP}] )
	autologging? ( <=dev-python/mlflow-2.16.0[${PYTHON_USEDEP}] )
	full? ( <=dev-python/mlflow-2.16.0[${PYTHON_USEDEP}] )
	testing? ( <=dev-python/mlflow-2.16.0[${PYTHON_USEDEP}] )
	testing? ( dev-python/nltk[${PYTHON_USEDEP}] )
	full? ( >=dev-python/numpy-1.15.0[${PYTHON_USEDEP}] )
	metadata? ( >=dev-python/numpy-1.15.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/numpy-1.15.0[${PYTHON_USEDEP}] )
	langchain-testing? ( <dev-python/openinference-instrumentation-langchain-0.2[${PYTHON_USEDEP}] )
	langchain? ( <dev-python/openinference-instrumentation-langchain-0.2[${PYTHON_USEDEP}] )
	langchain-testing? ( <dev-python/opentelemetry-exporter-gcp-trace-2[${PYTHON_USEDEP}] )
	reasoningengine? ( <dev-python/opentelemetry-exporter-gcp-trace-2[${PYTHON_USEDEP}] )
	langchain-testing? ( <dev-python/opentelemetry-sdk-2[${PYTHON_USEDEP}] )
	reasoningengine? ( <dev-python/opentelemetry-sdk-2[${PYTHON_USEDEP}] )
	>=dev-python/packaging-14.3[${PYTHON_USEDEP}]
	evaluation? ( >=dev-python/pandas-1.0.0[${PYTHON_USEDEP}] )
	full? ( >=dev-python/pandas-1.0.0[${PYTHON_USEDEP}] )
	lit? ( >=dev-python/pandas-1.0.0[${PYTHON_USEDEP}] )
	metadata? ( >=dev-python/pandas-1.0.0[${PYTHON_USEDEP}] )
	ray-testing? ( >=dev-python/pandas-1.0.0[${PYTHON_USEDEP}] )
	ray? ( >=dev-python/pandas-1.0.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pandas-1.0.0[${PYTHON_USEDEP}] )
	<dev-python/proto-plus-2.0.0dev[${PYTHON_USEDEP}]
	!=dev-python/protobuf-4.21.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/pyarrow-14.0.0[${PYTHON_USEDEP}]' python3_13{,t})
	$(python_gen_cond_dep '>=dev-python/pyarrow-14.0.0[${PYTHON_USEDEP}]' python3_13{,t})
	$(python_gen_cond_dep '>=dev-python/pyarrow-14.0.0[${PYTHON_USEDEP}]' python3_13{,t})
	full? ( >=dev-python/pyarrow-6.0.1[${PYTHON_USEDEP}] )
	ray-testing? ( >=dev-python/pyarrow-6.0.1[${PYTHON_USEDEP}] )
	ray? ( >=dev-python/pyarrow-6.0.1[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pyarrow-6.0.1[${PYTHON_USEDEP}] )
	<dev-python/pydantic-3[${PYTHON_USEDEP}]
	langchain-testing? ( <dev-python/pydantic-3[${PYTHON_USEDEP}] )
	reasoningengine? ( <dev-python/pydantic-3[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )
	langchain-testing? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	ray-testing? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	full? ( <dev-python/pyyaml-7[${PYTHON_USEDEP}] )
	pipelines? ( <dev-python/pyyaml-7[${PYTHON_USEDEP}] )
	testing? ( <dev-python/pyyaml-7[${PYTHON_USEDEP}] )
	ray-testing? ( dev-python/ray[train,${PYTHON_USEDEP}] )
	endpoint? ( >=dev-python/requests-2.28.1[${PYTHON_USEDEP}] )
	full? ( >=dev-python/requests-2.28.1[${PYTHON_USEDEP}] )
	private-endpoints? ( >=dev-python/requests-2.28.1[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/requests-2.28.1[${PYTHON_USEDEP}] )
	testing? ( <dev-python/requests-toolbelt-1.0.0[${PYTHON_USEDEP}] )
	dev-python/scikit-learn[${PYTHON_USEDEP}]
	ray-testing? ( <dev-python/scikit-learn-1.6.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/sentencepiece-0.2.0[${PYTHON_USEDEP}] )
	tokenization? ( >=dev-python/sentencepiece-0.2.0[${PYTHON_USEDEP}] )
	full? ( <dev-python/setuptools-70.0.0[${PYTHON_USEDEP}] )
	ray-testing? ( <dev-python/setuptools-70.0.0[${PYTHON_USEDEP}] )
	ray? ( <dev-python/setuptools-70.0.0[${PYTHON_USEDEP}] )
	testing? ( <dev-python/setuptools-70.0.0[${PYTHON_USEDEP}] )
	<dev-python/shapely-3.0.0dev[${PYTHON_USEDEP}]
	full? ( >=dev-python/starlette-0.17.1[${PYTHON_USEDEP}] )
	prediction? ( >=dev-python/starlette-0.17.1[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/starlette-0.17.1[${PYTHON_USEDEP}] )
	cloud-profiler? ( <dev-python/tensorboard-plugin-profile-2.18.0[${PYTHON_USEDEP}] )
	full? ( <dev-python/tensorboard-plugin-profile-2.18.0[${PYTHON_USEDEP}] )
	tensorboard? ( <dev-python/tensorboard-plugin-profile-2.18.0[${PYTHON_USEDEP}] )
	testing? ( <dev-python/tensorboard-plugin-profile-2.18.0[${PYTHON_USEDEP}] )
	cloud-profiler? ( <dev-python/tensorflow-3.0.0dev[${PYTHON_USEDEP}] )
	full? ( <dev-python/tensorflow-3.0.0dev[${PYTHON_USEDEP}] )
	full? ( <dev-python/tensorflow-3.0.0dev[${PYTHON_USEDEP}] )
	lit? ( <dev-python/tensorflow-3.0.0dev[${PYTHON_USEDEP}] )
	ray-testing? ( dev-python/tensorflow[${PYTHON_USEDEP}] )
	tensorboard? ( <dev-python/tensorflow-3.0.0dev[${PYTHON_USEDEP}] )
	testing? ( <dev-python/tensorflow-3.0.0dev[${PYTHON_USEDEP}] )
	testing? ( <dev-python/tensorflow-3.0.0dev[${PYTHON_USEDEP}] )
	xai? ( <dev-python/tensorflow-3.0.0dev[${PYTHON_USEDEP}] )
	~dev-python/tensorflow-2.16.1[${PYTHON_USEDEP}]
	>=dev-python/torch-2.2.0[${PYTHON_USEDEP}]
	ray-testing? ( <dev-python/torch-2.1.0[${PYTHON_USEDEP}] )
	evaluation? ( >=dev-python/tqdm-4.23.0[${PYTHON_USEDEP}] )
	full? ( >=dev-python/tqdm-4.23.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/tqdm-4.23.0[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	langchain-testing? ( dev-python/typing-extensions[${PYTHON_USEDEP}] )
	reasoningengine? ( dev-python/typing-extensions[${PYTHON_USEDEP}] )
	full? ( <dev-python/urllib3-1.27[${PYTHON_USEDEP}] )
	private-endpoints? ( <dev-python/urllib3-1.27[${PYTHON_USEDEP}] )
	testing? ( <dev-python/urllib3-1.27[${PYTHON_USEDEP}] )
	full? ( >=dev-python/uvicorn-0.16.0[standard,${PYTHON_USEDEP}] )
	prediction? ( >=dev-python/uvicorn-0.16.0[standard,${PYTHON_USEDEP}] )
	testing? ( >=dev-python/uvicorn-0.16.0[standard,${PYTHON_USEDEP}] )
	cloud-profiler? ( <dev-python/werkzeug-2.1.0dev[${PYTHON_USEDEP}] )
	full? ( <dev-python/werkzeug-2.1.0dev[${PYTHON_USEDEP}] )
	tensorboard? ( <dev-python/werkzeug-2.1.0dev[${PYTHON_USEDEP}] )
	testing? ( <dev-python/werkzeug-2.1.0dev[${PYTHON_USEDEP}] )
	ray-testing? ( dev-python/xgboost[${PYTHON_USEDEP}] )
	testing? ( dev-python/xgboost[${PYTHON_USEDEP}] )
	ray-testing? ( dev-python/xgboost-ray[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest