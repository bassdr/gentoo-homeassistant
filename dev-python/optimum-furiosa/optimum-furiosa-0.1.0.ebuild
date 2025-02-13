# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="quality"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/optimum-furiosa/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	quality? ( ~dev-python/black-23.1[${PYTHON_USEDEP}] )
	>=dev-python/datasets-1.4.0[${PYTHON_USEDEP}]
	dev-python/furiosa-optimizer[${PYTHON_USEDEP}]
	~dev-python/furiosa-quantizer-0.9.0[${PYTHON_USEDEP}]
	~dev-python/furiosa-quantizer-impl-0.9.1[${PYTHON_USEDEP}]
	dev-python/furiosa-sdk[${PYTHON_USEDEP}]
	>=dev-python/onnx-1.12.0[${PYTHON_USEDEP}]
	>=dev-python/optimum-1.8.0[${PYTHON_USEDEP}]
	quality? ( >=dev-python/ruff-0.0.241[${PYTHON_USEDEP}] )
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/sentencepiece[${PYTHON_USEDEP}]
	>=dev-python/transformers-4.20.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/filelock[${PYTHON_USEDEP}]
	dev-python/gitpython[${PYTHON_USEDEP}]
	dev-python/librosa[${PYTHON_USEDEP}]
	dev-python/parameterized[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-pythonpath[${PYTHON_USEDEP}]
	dev-python/pytest-xdist[${PYTHON_USEDEP}]
	dev-python/soundfile[${PYTHON_USEDEP}]
)"
