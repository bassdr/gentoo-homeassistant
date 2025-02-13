# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="fl-crypto fl-crypto-rt24-1 fl-rt23-1-py3-10 fl-rt24-1-py3-11 rag"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ibm-watsonx-ai/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	rag? ( ~dev-python/beautifulsoup4-4.12.3[${PYTHON_USEDEP}] )
	dev-python/certifi[${PYTHON_USEDEP}]
	fl-rt23-1-py3-10? ( ~dev-python/cryptography-42.0.5[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/cryptography-42.0.5[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/ddsketch-2.0.4[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/ddsketch-2.0.4[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/diffprivlib-0.5.1[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/diffprivlib-0.5.1[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/environs-9.5.0[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/environs-9.5.0[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( dev-python/gputil[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( dev-python/gputil[${PYTHON_USEDEP}] )
	rag? ( >=dev-python/grpcio-1.54.3[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( dev-python/gym[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( dev-python/gym[${PYTHON_USEDEP}] )
	dev-python/httpx[${PYTHON_USEDEP}]
	<dev-python/ibm-cos-sdk-2.14.0[${PYTHON_USEDEP}]
	fl-rt23-1-py3-10? ( ~dev-python/image-1.5.33[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/image-1.5.33[${PYTHON_USEDEP}] )
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	fl-rt23-1-py3-10? ( ~dev-python/joblib-1.1.1[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/joblib-1.3.2[${PYTHON_USEDEP}] )
	rag? ( <dev-python/langchain-0.4[${PYTHON_USEDEP}] )
	rag? ( ~dev-python/langchain-chroma-0.1.4[${PYTHON_USEDEP}] )
	rag? ( <dev-python/langchain-community-0.4[${PYTHON_USEDEP}] )
	rag? ( <dev-python/langchain-core-0.4[${PYTHON_USEDEP}] )
	rag? ( ~dev-python/langchain-elasticsearch-0.3.0[${PYTHON_USEDEP}] )
	rag? ( <dev-python/langchain-ibm-0.4[${PYTHON_USEDEP}] )
	rag? ( ~dev-python/langchain-milvus-0.1.7[${PYTHON_USEDEP}] )
	dev-python/lomond[${PYTHON_USEDEP}]
	fl-rt23-1-py3-10? ( dev-python/lz4[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( dev-python/lz4[${PYTHON_USEDEP}] )
	rag? ( ~dev-python/markdown-3.4.1[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/msgpack-1.0.7[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/msgpack-1.0.7[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/msgpack-numpy-0.4.8[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/msgpack-numpy-0.4.8[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/numcompress-0.1.2[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/numcompress-0.1.2[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/numpy-1.23.5[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/numpy-1.26.4[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	<dev-python/pandas-2.2.0[${PYTHON_USEDEP}]
	fl-rt23-1-py3-10? ( ~dev-python/pandas-1.5.3[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/pandas-2.1.4[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/parse-1.19.0[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/parse-1.19.0[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/pathlib2-2.3.6[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/pathlib2-2.3.6[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/protobuf-4.22.1[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/protobuf-4.22.1[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( dev-python/psutil[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( dev-python/psutil[${PYTHON_USEDEP}] )
	fl-crypto-rt24-1? ( ~dev-python/pyhelayers-1.5.3.1[${PYTHON_USEDEP}] )
	fl-crypto? ( ~dev-python/pyhelayers-1.5.0.3[${PYTHON_USEDEP}] )
	rag? ( ~dev-python/pypdf-4.2.0[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/pytest-6.2.5[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/pytest-6.2.5[${PYTHON_USEDEP}] )
	rag? ( ~dev-python/python-docx-1.1.2[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	fl-rt23-1-py3-10? ( ~dev-python/requests-2.32.3[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/requests-2.32.3[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/scikit-learn-1.1.1[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/scikit-learn-1.3.0[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/scipy-1.10.1[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/scipy-1.11.4[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( dev-python/setproctitle[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( dev-python/setproctitle[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/skops-0.9.0[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/skops-0.9.0[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/skorch-0.12.0[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/skorch-0.12.0[${PYTHON_USEDEP}] )
	dev-python/tabulate[${PYTHON_USEDEP}]
	fl-rt23-1-py3-10? ( ~dev-python/tabulate-0.8.9[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/tabulate-0.8.9[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/tensorflow-2.12.0[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/tensorflow-2.14.1[${PYTHON_USEDEP}] )
	fl-rt23-1-py3-10? ( ~dev-python/torch-2.0.1[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/torch-2.1.2[${PYTHON_USEDEP}] )
	dev-python/urllib3[${PYTHON_USEDEP}]
	fl-rt23-1-py3-10? ( ~dev-python/websockets-10.1[${PYTHON_USEDEP}] )
	fl-rt24-1-py3-11? ( ~dev-python/websockets-10.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest