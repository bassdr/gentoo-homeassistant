# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="training"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/open-clip-torch/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	training? ( dev-python/fsspec[${PYTHON_USEDEP}] )
	dev-python/ftfy[${PYTHON_USEDEP}]
	dev-python/huggingface-hub[${PYTHON_USEDEP}]
	training? ( dev-python/pandas[${PYTHON_USEDEP}] )
	dev-python/regex[${PYTHON_USEDEP}]
	dev-python/safetensors[${PYTHON_USEDEP}]
	dev-python/timm[${PYTHON_USEDEP}]
	training? ( >=dev-python/timm-1.0.10[${PYTHON_USEDEP}] )
	>=dev-python/torch-1.9.0[${PYTHON_USEDEP}]
	training? ( >=dev-python/torch-2.0[${PYTHON_USEDEP}] )
	dev-python/torchvision[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	training? ( dev-python/transformers[sentencepiece,${PYTHON_USEDEP}] )
	training? ( <=dev-python/webdataset-0.2.86[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/open-clip-torch[training,${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-split[${PYTHON_USEDEP}]
)"
