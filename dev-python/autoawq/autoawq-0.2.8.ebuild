# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="cpu eval kernels"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/autoawq/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	accelerate
	autoawq-kernels; extra == 'kernels'
	black; extra == 'dev'
	datasets>=2.20
	evaluate; extra == 'eval'
	flash-attn>=2.2.0; extra == 'kernels'
	griffe-typingdoc; extra == 'dev'
	huggingface_hub>=0.26.5
	intel-extension-for-pytorch>=2.4.0; extra == 'cpu'
	lm_eval==0.4.1; extra == 'eval'
	mkdocs-material; extra == 'dev'
	mkdocstrings-python; extra == 'dev'
	protobuf; extra == 'eval'
	scipy; extra == 'eval'
	tabulate; extra == 'eval'
	tokenizers>=0.12.1
	torch>=2.5.1
	transformers<=4.47.1,>=4.45.0
	triton
	typing_extensions>=4.8.0
	zstandard
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/accelerate[${PYTHON_USEDEP}]
	kernels? ( dev-python/autoawq-kernels[${PYTHON_USEDEP}] )
	>=dev-python/datasets-2.20[${PYTHON_USEDEP}]
	eval? ( dev-python/evaluate[${PYTHON_USEDEP}] )
	kernels? ( >=dev-python/flash-attn-2.2.0[${PYTHON_USEDEP}] )
	>=dev-python/huggingface-hub-0.26.5[${PYTHON_USEDEP}]
	cpu? ( >=dev-python/intel-extension-for-pytorch-2.4.0[${PYTHON_USEDEP}] )
	eval? ( ~dev-python/lm-eval-0.4.1[${PYTHON_USEDEP}] )
	eval? ( dev-python/protobuf[${PYTHON_USEDEP}] )
	eval? ( dev-python/scipy[${PYTHON_USEDEP}] )
	eval? ( dev-python/tabulate[${PYTHON_USEDEP}] )
	>=dev-python/torch-2.5.1[${PYTHON_USEDEP}]
	>=dev-python/transformers-4.45.0[${PYTHON_USEDEP}] <=dev-python/transformers-4.47.1[${PYTHON_USEDEP}]
	dev-python/triton[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.8.0[${PYTHON_USEDEP}]
	dev-python/zstandard[${PYTHON_USEDEP}]
	>=sci-libs/tokenizers-0.12.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/griffe-typingdoc[${PYTHON_USEDEP}]
		dev-python/mkdocs-material[${PYTHON_USEDEP}]
		dev-python/mkdocstrings-python[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

