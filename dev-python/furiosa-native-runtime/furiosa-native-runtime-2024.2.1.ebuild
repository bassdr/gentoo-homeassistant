# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/furiosa-native-runtime/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	~dev-python/furiosa-native-compiler-2024.2.0[${PYTHON_USEDEP}]
	test? ( dev-python/mnist[${PYTHON_USEDEP}] )
	~dev-python/numpy-1.24[${PYTHON_USEDEP}]
	test? ( ~dev-python/onnxruntime-1.15.1[${PYTHON_USEDEP}] )
	~dev-python/pandas-2.0.3[${PYTHON_USEDEP}]
	~dev-python/pyarrow-12.0[${PYTHON_USEDEP}]
	test? ( ~dev-python/pytest-7.3[${PYTHON_USEDEP}] )
	test? ( ~dev-python/pytest-asyncio-0.21[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	~dev-python/requests-2.29.0[${PYTHON_USEDEP}]
	~dev-python/torch-2.4.1[${PYTHON_USEDEP}]
	~dev-python/transformers-4.44.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest