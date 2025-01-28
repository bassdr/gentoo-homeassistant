# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="anomaly aqua bds boosted data feature-store-marketplace forecast geo huggingface llm notebook onnx opctl optuna pii recommender spark tensorflow testsuite text torch viz"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/oracle-ads/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	pii? ( dev-python/aiohttp[${PYTHON_USEDEP}] )
	testsuite? ( dev-python/arff[${PYTHON_USEDEP}] )
	>=dev-python/asteval-0.9.25[${PYTHON_USEDEP}]
	testsuite? ( ~dev-python/autogen-agentchat-0.2[${PYTHON_USEDEP}] )
	anomaly? ( dev-python/autots[${PYTHON_USEDEP}] )
	forecast? ( dev-python/autots[additional,${PYTHON_USEDEP}] )
	viz? ( <dev-python/bokeh-3.2.0[${PYTHON_USEDEP}] )
	opctl? ( dev-python/cachetools[${PYTHON_USEDEP}] )
	testsuite? ( ~dev-python/category-encoders-2.6.3[${PYTHON_USEDEP}] )
	>=dev-python/cerberus-1.3.4[${PYTHON_USEDEP}]
	>=dev-python/cloudpickle-1.6.0[${PYTHON_USEDEP}]
	testsuite? ( ~dev-python/cohere-4.53[${PYTHON_USEDEP}] )
	forecast? ( dev-python/conda-pack[${PYTHON_USEDEP}] )
	opctl? ( dev-python/conda-pack[${PYTHON_USEDEP}] )
	data? ( >=dev-python/datefinder-0.7.1[${PYTHON_USEDEP}] )
	opctl? ( dev-python/docker[${PYTHON_USEDEP}] )
	llm? ( >=dev-python/evaluate-0.4.0[${PYTHON_USEDEP}] )
	testsuite? ( dev-python/faiss-cpu[${PYTHON_USEDEP}] )
	data? ( >=dev-python/fastavro-0.24.2[${PYTHON_USEDEP}] )
	testsuite? ( ~dev-python/fastparquet-2024.2.0[${PYTHON_USEDEP}] )
	geo? ( <=dev-python/fiona-1.9.6[${PYTHON_USEDEP}] )
	opctl? ( dev-python/fire[${PYTHON_USEDEP}] )
	viz? ( >=dev-python/folium-0.12.1[${PYTHON_USEDEP}] )
	>=dev-python/fsspec-0.8.7[${PYTHON_USEDEP}]
	pii? ( dev-python/gender-guesser[${PYTHON_USEDEP}] )
	geo? ( <dev-python/geopandas-1.0.0[${PYTHON_USEDEP}] )
	>=dev-python/gitpython-3.1.2[${PYTHON_USEDEP}]
	viz? ( <dev-python/graphviz-0.17[${PYTHON_USEDEP}] )
	bds? ( dev-python/hdfs[kerberos,${PYTHON_USEDEP}] )
	data? ( >=dev-python/htmllistparse-0.6.0[${PYTHON_USEDEP}] )
	opctl? ( ~dev-python/huggingface-hub-0.26.2[${PYTHON_USEDEP}] )
	bds? ( dev-python/ibis-framework[impala,${PYTHON_USEDEP}] )
	testsuite? ( dev-python/imbalanced-learn[${PYTHON_USEDEP}] )
	forecast? ( dev-python/inflection[${PYTHON_USEDEP}] )
	opctl? ( dev-python/inflection[${PYTHON_USEDEP}] )
	notebook? ( <dev-python/ipython-8.0[${PYTHON_USEDEP}] )
	notebook? ( ~dev-python/ipywidgets-7.6.3[${PYTHON_USEDEP}] )
	>=dev-python/jinja2-2.11.2[${PYTHON_USEDEP}]
	aqua? ( dev-python/jupyter-server[${PYTHON_USEDEP}] )
	feature-store-marketplace? ( dev-python/kubernetes[${PYTHON_USEDEP}] )
	llm? ( >=dev-python/langchain-0.2[${PYTHON_USEDEP}] )
	llm? ( dev-python/langchain-community[${PYTHON_USEDEP}] )
	llm? ( dev-python/langchain-openai[${PYTHON_USEDEP}] )
	boosted? ( dev-python/lightgbm[${PYTHON_USEDEP}] )
	onnx? ( dev-python/lightgbm[${PYTHON_USEDEP}] )
	testsuite? ( dev-python/lxml[${PYTHON_USEDEP}] )
	<=dev-python/matplotlib-3.8.4[${PYTHON_USEDEP}]
	forecast? ( dev-python/mlforecast[${PYTHON_USEDEP}] )
	testsuite? ( dev-python/mysql-connector-python[${PYTHON_USEDEP}] )
	pii? ( dev-python/nameparser[${PYTHON_USEDEP}] )
	forecast? ( dev-python/nbconvert[${PYTHON_USEDEP}] )
	opctl? ( dev-python/nbconvert[${PYTHON_USEDEP}] )
	forecast? ( dev-python/nbformat[${PYTHON_USEDEP}] )
	opctl? ( dev-python/nbformat[${PYTHON_USEDEP}] )
	forecast? ( >=dev-python/neuralprophet-0.7.0[${PYTHON_USEDEP}] )
	testsuite? ( dev-python/nltk[${PYTHON_USEDEP}] )
	testsuite? ( ~dev-python/notebook-6.4.12[${PYTHON_USEDEP}] )
	<dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
	forecast? ( <dev-python/numpy-2.0.0[${PYTHON_USEDEP}] )
	>=dev-python/oci-2.125.3[${PYTHON_USEDEP}]
	forecast? ( dev-python/oci-cli[${PYTHON_USEDEP}] )
	opctl? ( dev-python/oci-cli[${PYTHON_USEDEP}] )
	>=dev-python/ocifs-1.1.3[${PYTHON_USEDEP}]
	onnx? ( <=dev-python/onnx-1.15.0[${PYTHON_USEDEP}] )
	onnx? ( >=dev-python/onnxmltools-1.10.0[${PYTHON_USEDEP}] )
	onnx? ( !=dev-python/onnxruntime-1.16.0[${PYTHON_USEDEP}] )
	data? ( >=dev-python/openpyxl-3.0.7[${PYTHON_USEDEP}] )
	testsuite? ( dev-python/opensearch-py[${PYTHON_USEDEP}] )
	forecast? ( dev-python/optuna[${PYTHON_USEDEP}] )
	optuna? ( ~dev-python/optuna-2.9.0[${PYTHON_USEDEP}] )
	anomaly? ( dev-python/oracle-ads[opctl,${PYTHON_USEDEP}] )
	feature-store-marketplace? ( dev-python/oracle-ads[opctl,${PYTHON_USEDEP}] )
	forecast? ( dev-python/oracle-ads[${PYTHON_USEDEP}] )
	geo? ( dev-python/oracle-ads[viz,${PYTHON_USEDEP}] )
	onnx? ( dev-python/oracle-ads[viz,${PYTHON_USEDEP}] )
	optuna? ( dev-python/oracle-ads[viz,${PYTHON_USEDEP}] )
	pii? ( dev-python/oracle-ads[opctl,${PYTHON_USEDEP}] )
	recommender? ( dev-python/oracle-ads[opctl,${PYTHON_USEDEP}] )
	tensorflow? ( dev-python/oracle-ads[viz,${PYTHON_USEDEP}] )
	torch? ( dev-python/oracle-ads[viz,${PYTHON_USEDEP}] )
	anomaly? ( dev-python/oracledb[${PYTHON_USEDEP}] )
	data? ( >=dev-python/oracledb-1.0[${PYTHON_USEDEP}] )
	forecast? ( dev-python/oracledb[${PYTHON_USEDEP}] )
	>dev-python/pandas-1.2.1[${PYTHON_USEDEP}]
	data? ( >=dev-python/pandavro-1.6.0[${PYTHON_USEDEP}] )
	testsuite? ( dev-python/pdfplumber[${PYTHON_USEDEP}] )
	forecast? ( dev-python/plotly[${PYTHON_USEDEP}] )
	pii? ( dev-python/plotly[${PYTHON_USEDEP}] )
	recommender? ( dev-python/plotly[${PYTHON_USEDEP}] )
	forecast? ( dev-python/pmdarima[${PYTHON_USEDEP}] )
	forecast? ( dev-python/prophet[${PYTHON_USEDEP}] )
	onnx? ( dev-python/protobuf[${PYTHON_USEDEP}] )
	>=dev-python/psutil-5.7.2[${PYTHON_USEDEP}]
	forecast? ( dev-python/py-cpuinfo[${PYTHON_USEDEP}] )
	opctl? ( dev-python/py-cpuinfo[${PYTHON_USEDEP}] )
	testsuite? ( dev-python/py4j[${PYTHON_USEDEP}] )
	testsuite? ( >=dev-python/pyarrow-15.0.0[${PYTHON_USEDEP}] )
	>=dev-python/pydantic-2.6.3[${PYTHON_USEDEP}]
	llm? ( <dev-python/pydantic-3[${PYTHON_USEDEP}] )
	spark? ( >=dev-python/pyspark-3.0.0[${PYTHON_USEDEP}] )
	>=dev-python/python-jsonschema-objects-0.3.13[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6[${PYTHON_USEDEP}]
	anomaly? ( ~dev-python/report-creator-1.0.28[${PYTHON_USEDEP}] )
	forecast? ( ~dev-python/report-creator-1.0.28[${PYTHON_USEDEP}] )
	pii? ( ~dev-python/report-creator-1.0.28[${PYTHON_USEDEP}] )
	recommender? ( ~dev-python/report-creator-1.0.28[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	forecast? ( dev-python/rich[${PYTHON_USEDEP}] )
	opctl? ( dev-python/rich[${PYTHON_USEDEP}] )
	anomaly? ( ~dev-python/rrcf-0.4.4[${PYTHON_USEDEP}] )
	anomaly? ( ~dev-python/salesforce-merlion-2.0.4[all,${PYTHON_USEDEP}] )
	<dev-python/scikit-learn-1.6.0[${PYTHON_USEDEP}]
	anomaly? ( <dev-python/scikit-learn-1.6.0[${PYTHON_USEDEP}] )
	recommender? ( dev-python/scikit-surprise[${PYTHON_USEDEP}] )
	viz? ( >=dev-python/scipy-1.5.4[${PYTHON_USEDEP}] )
	pii? ( ~dev-python/scrubadub-2.0.1[${PYTHON_USEDEP}] )
	pii? ( dev-python/scrubadub-spacy[${PYTHON_USEDEP}] )
	viz? ( >=dev-python/seaborn-0.11.0[${PYTHON_USEDEP}] )
	forecast? ( dev-python/shap[${PYTHON_USEDEP}] )
	onnx? ( >=dev-python/skl2onnx-1.10.4[${PYTHON_USEDEP}] )
	forecast? ( dev-python/sktime[${PYTHON_USEDEP}] )
	pii? ( ~dev-python/spacy-3.6.1[${PYTHON_USEDEP}] )
	text? ( <dev-python/spacy-3.8[${PYTHON_USEDEP}] )
	pii? ( ~dev-python/spacy-transformers-1.2.5[${PYTHON_USEDEP}] )
	bds? ( dev-python/sqlalchemy[${PYTHON_USEDEP}] )
	data? ( <=dev-python/sqlalchemy-1.4.46[${PYTHON_USEDEP}] )
	forecast? ( dev-python/statsmodels[${PYTHON_USEDEP}] )
	testsuite? ( >=dev-python/statsmodels-0.14.1[${PYTHON_USEDEP}] )
	testsuite? ( dev-python/statsmodels[${PYTHON_USEDEP}] )
	testsuite? ( >dev-python/tables-3.9.0[${PYTHON_USEDEP}] )
	testsuite? ( dev-python/tables[${PYTHON_USEDEP}] )
	>=dev-python/tabulate-0.8.9[${PYTHON_USEDEP}]
	tensorflow? ( <=dev-python/tensorflow-2.15.1[${PYTHON_USEDEP}] )
	huggingface? ( dev-python/tf-keras[${PYTHON_USEDEP}] )
	onnx? ( dev-python/tf2onnx[${PYTHON_USEDEP}] )
	torch? ( dev-python/torch[${PYTHON_USEDEP}] )
	torch? ( dev-python/torchvision[${PYTHON_USEDEP}] )
	>=dev-python/tqdm-4.59.0[${PYTHON_USEDEP}]
	huggingface? ( dev-python/transformers[${PYTHON_USEDEP}] )
	text? ( >=dev-python/wordcloud-1.8.1[${PYTHON_USEDEP}] )
	boosted? ( dev-python/xgboost[${PYTHON_USEDEP}] )
	onnx? ( <=dev-python/xgboost-1.7[${PYTHON_USEDEP}] )
	testsuite? ( >=dev-python/xlrd-1.2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest