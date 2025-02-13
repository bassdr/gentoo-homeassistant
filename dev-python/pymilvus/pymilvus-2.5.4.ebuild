# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="bulk-writer model"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pymilvus/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	bulk-writer? ( dev-python/azure-storage-blob[${PYTHON_USEDEP}] )
	<=dev-python/grpcio-1.67.1[${PYTHON_USEDEP}]
	model? ( >=dev-python/milvus-model-0.1.0[${PYTHON_USEDEP}] )
	bulk-writer? ( >=dev-python/minio-7.0.0[${PYTHON_USEDEP}] )
	<dev-python/numpy-1.25.0[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.2.4[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.20.0[${PYTHON_USEDEP}]
	bulk-writer? ( >=dev-python/pyarrow-12.0.0[${PYTHON_USEDEP}] )
	<dev-python/python-dotenv-2.0.0[${PYTHON_USEDEP}]
	bulk-writer? ( dev-python/requests[${PYTHON_USEDEP}] )
	>dev-python/setuptools-69[${PYTHON_USEDEP}]
	<dev-python/setuptools-70.1[${PYTHON_USEDEP}]
	>=dev-python/ujson-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/black[${PYTHON_USEDEP}]
	~dev-python/grpcio-1.62.2[${PYTHON_USEDEP}]
	~dev-python/grpcio-testing-1.62.2[${PYTHON_USEDEP}]
	~dev-python/grpcio-tools-1.62.2[${PYTHON_USEDEP}]
	>=dev-python/pytest-5.3.4[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-2.8.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-timeout-1.3.4[${PYTHON_USEDEP}]
	>dev-python/ruff-0.4.0[${PYTHON_USEDEP}]
)"
