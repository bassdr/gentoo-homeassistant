# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="aws azure dask dataframe docs gcp interactive interactive-test ml-test p312-ml-test test yaml"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apache-beam/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	azure? ( <dev-python/azure-core-2[${PYTHON_USEDEP}] )
	azure? ( <dev-python/azure-identity-2[${PYTHON_USEDEP}] )
	azure? ( <dev-python/azure-storage-blob-13[${PYTHON_USEDEP}] )
	aws? ( <dev-python/boto3-2[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/cachetools-6[${PYTHON_USEDEP}] )
	interactive-test? ( <dev-python/chromedriver-binary-118[${PYTHON_USEDEP}] )
	~dev-python/cloudpickle-2.2.1[${PYTHON_USEDEP}]
	<dev-python/crcmod-2.0[${PYTHON_USEDEP}]
	test? ( >=dev-python/cryptography-41.0.2[${PYTHON_USEDEP}] )
	dask? ( >=dev-python/dask-2024.4.2[${PYTHON_USEDEP}] )
	ml-test? ( dev-python/datatable[${PYTHON_USEDEP}] )
	p312-ml-test? ( dev-python/datatable[${PYTHON_USEDEP}] )
	<dev-python/dill-0.3.2[${PYTHON_USEDEP}]
	dask? ( >=dev-python/distributed-2024.4.2[${PYTHON_USEDEP}] )
	docs? ( <dev-python/docstring-parser-1.0[${PYTHON_USEDEP}] )
	test? ( <dev-python/docstring-parser-1.0[${PYTHON_USEDEP}] )
	yaml? ( <dev-python/docstring-parser-1.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/docutils-0.18.1[${PYTHON_USEDEP}] )
	ml-test? ( dev-python/embeddings[${PYTHON_USEDEP}] )
	p312-ml-test? ( dev-python/embeddings[${PYTHON_USEDEP}] )
	interactive? ( <dev-python/facets-overview-2[${PYTHON_USEDEP}] )
	<dev-python/fastavro-2[${PYTHON_USEDEP}]
	<dev-python/fasteners-1.0[${PYTHON_USEDEP}]
	test? ( >=dev-python/freezegun-0.3.12[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-api-core-3[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-apitools-0.5.32[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-auth-3[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-auth-httplib2-0.3.0[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-cloud-aiplatform-2.0[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-cloud-bigquery-4[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-cloud-bigquery-storage-3[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-cloud-bigtable-3[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-cloud-core-3[${PYTHON_USEDEP}] )
	interactive? ( <dev-python/google-cloud-dataproc-6[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-cloud-datastore-3[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-cloud-dlp-4[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-cloud-language-3[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-cloud-pubsub-3[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-cloud-pubsublite-2[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-cloud-recommendations-ai-0.11.0[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-cloud-spanner-4[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-cloud-storage-3[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-cloud-videointelligence-3[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/google-cloud-vision-4[${PYTHON_USEDEP}] )
	!=dev-python/grpcio-1.48.0[${PYTHON_USEDEP}]
	<dev-python/hdfs-3.0.0[${PYTHON_USEDEP}]
	<dev-python/httplib2-0.23.0[${PYTHON_USEDEP}]
	test? ( <dev-python/hypothesis-7.0.0[${PYTHON_USEDEP}] )
	interactive? ( <dev-python/ipykernel-7[${PYTHON_USEDEP}] )
	interactive? ( <dev-python/ipython-9[${PYTHON_USEDEP}] )
	interactive? ( <dev-python/ipywidgets-9[${PYTHON_USEDEP}] )
	docs? ( <dev-python/jinja2-3.2[${PYTHON_USEDEP}] )
	test? ( <dev-python/jinja2-3.2[${PYTHON_USEDEP}] )
	yaml? ( <dev-python/jinja2-3.2[${PYTHON_USEDEP}] )
	test? ( >=dev-python/joblib-1.0.1[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep '<dev-python/js2py-1[${PYTHON_USEDEP}]' python3_12)
	<dev-python/jsonpickle-4.0.0[${PYTHON_USEDEP}]
	<dev-python/jsonschema-5.0.0[${PYTHON_USEDEP}]
	interactive? ( !=dev-python/jupyter-client-6.1.13[${PYTHON_USEDEP}] )
	gcp? ( dev-python/keyrings-google-artifactregistry-auth[${PYTHON_USEDEP}] )
	test? ( <dev-python/mock-6.0.0[${PYTHON_USEDEP}] )
	interactive? ( <dev-python/nbconvert-8[${PYTHON_USEDEP}] )
	interactive? ( <dev-python/nbformat-6[${PYTHON_USEDEP}] )
	interactive-test? ( <dev-python/needle-1[${PYTHON_USEDEP}] )
	<dev-python/numpy-2.3.0[${PYTHON_USEDEP}]
	<dev-python/objsize-0.8.0[${PYTHON_USEDEP}]
	ml-test? ( dev-python/onnxruntime[${PYTHON_USEDEP}] )
	p312-ml-test? ( dev-python/onnxruntime[${PYTHON_USEDEP}] )
	docs? ( dev-python/openai[${PYTHON_USEDEP}] )
	<dev-python/orjson-4[${PYTHON_USEDEP}]
	>=dev-python/packaging-22.0[${PYTHON_USEDEP}]
	dataframe? ( !=dev-python/pandas-1.5.0[${PYTHON_USEDEP}] )
	docs? ( <dev-python/pandas-2.2.0[${PYTHON_USEDEP}] )
	interactive? ( !=dev-python/pandas-1.5.0[${PYTHON_USEDEP}] )
	test? ( <dev-python/pandas-2.2.0[${PYTHON_USEDEP}] )
	yaml? ( !=dev-python/pandas-1.5.0[${PYTHON_USEDEP}] )
	test? ( <dev-python/parameterized-0.10.0[${PYTHON_USEDEP}] )
	interactive-test? ( <dev-python/pillow-10[${PYTHON_USEDEP}] )
	ml-test? ( dev-python/pillow[${PYTHON_USEDEP}] )
	p312-ml-test? ( dev-python/pillow[${PYTHON_USEDEP}] )
	<dev-python/proto-plus-2[${PYTHON_USEDEP}]
	!=dev-python/protobuf-4.0*[${PYTHON_USEDEP}]
	test? ( !=dev-python/psycopg2-binary-2.9.10[${PYTHON_USEDEP}] )
	<dev-python/pyarrow-17.0.0[${PYTHON_USEDEP}]
	<dev-python/pyarrow-hotfix-1[${PYTHON_USEDEP}]
	<dev-python/pydot-2[${PYTHON_USEDEP}]
	test? ( !=dev-python/pyhamcrest-1.10.0[${PYTHON_USEDEP}] )
	<dev-python/pymongo-5.0.0[${PYTHON_USEDEP}]
	test? ( <dev-python/pytest-8.0[${PYTHON_USEDEP}] )
	test? ( <dev-python/pytest-timeout-3[${PYTHON_USEDEP}] )
	test? ( <dev-python/pytest-xdist-4[${PYTHON_USEDEP}] )
	<dev-python/python-dateutil-3[${PYTHON_USEDEP}]
	>=dev-python/pytz-2018.3[${PYTHON_USEDEP}]
	<dev-python/pyyaml-7.0.0[${PYTHON_USEDEP}]
	<dev-python/redis-6[${PYTHON_USEDEP}]
	>=dev-python/regex-2020.6.8[${PYTHON_USEDEP}]
	<dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	test? ( <dev-python/requests-mock-2.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/scikit-learn-0.20.0[${PYTHON_USEDEP}] )
	ml-test? ( dev-python/sentence-transformers[${PYTHON_USEDEP}] )
	p312-ml-test? ( dev-python/sentence-transformers[${PYTHON_USEDEP}] )
	test? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	ml-test? ( dev-python/skl2onnx[${PYTHON_USEDEP}] )
	p312-ml-test? ( dev-python/skl2onnx[${PYTHON_USEDEP}] )
	>=dev-python/sortedcontainers-2.4.0[${PYTHON_USEDEP}]
	docs? ( <dev-python/sphinx-8.0[${PYTHON_USEDEP}] )
	test? ( <dev-python/sqlalchemy-3.0[${PYTHON_USEDEP}] )
	test? ( <dev-python/tenacity-9[${PYTHON_USEDEP}] )
	ml-test? ( dev-python/tensorflow[${PYTHON_USEDEP}] )
	p312-ml-test? ( dev-python/tensorflow[${PYTHON_USEDEP}] )
	ml-test? ( dev-python/tensorflow-hub[${PYTHON_USEDEP}] )
	p312-ml-test? ( dev-python/tensorflow-hub[${PYTHON_USEDEP}] )
	ml-test? ( dev-python/tensorflow-transform[${PYTHON_USEDEP}] )
	test? ( <dev-python/testcontainers-4.0.0[mysql,${PYTHON_USEDEP}] )
	ml-test? ( dev-python/tf2onnx[${PYTHON_USEDEP}] )
	p312-ml-test? ( dev-python/tf2onnx[${PYTHON_USEDEP}] )
	interactive? ( <dev-python/timeloop-2[${PYTHON_USEDEP}] )
	ml-test? ( dev-python/torch[${PYTHON_USEDEP}] )
	p312-ml-test? ( dev-python/torch[${PYTHON_USEDEP}] )
	ml-test? ( dev-python/transformers[${PYTHON_USEDEP}] )
	p312-ml-test? ( dev-python/transformers[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-3.7.0[${PYTHON_USEDEP}]
	interactive-test? ( <dev-python/urllib3-2[${PYTHON_USEDEP}] )
	yaml? ( <dev-python/virtualenv-clone-1.0[${PYTHON_USEDEP}] )
	<dev-python/zstandard-1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest