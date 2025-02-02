# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs-specific quality"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/peft/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/accelerate-0.21.0[${PYTHON_USEDEP}]
	docs-specific? ( dev-python/black[${PYTHON_USEDEP}] )
	quality? ( dev-python/black[${PYTHON_USEDEP}] )
	docs-specific? ( dev-python/hf-doc-builder[${PYTHON_USEDEP}] )
	quality? ( dev-python/hf-doc-builder[${PYTHON_USEDEP}] )
	>=dev-python/huggingface-hub-0.25.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.17[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	quality? ( ~dev-python/ruff-0.6.1[${PYTHON_USEDEP}] )
	dev-python/safetensors[${PYTHON_USEDEP}]
	>=dev-python/torch-1.13.0[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/transformers[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/black[${PYTHON_USEDEP}]
	dev-python/datasets[${PYTHON_USEDEP}]
	dev-python/diffusers[${PYTHON_USEDEP}]
	dev-python/hf-doc-builder[${PYTHON_USEDEP}]
	dev-python/parameterized[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/pytest-xdist[${PYTHON_USEDEP}]
	~dev-python/ruff-0.6.1[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/sentencepiece[${PYTHON_USEDEP}]
)"
