# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="benchmark deepspeed diffusers liger llm-judge peft quantization"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/trl/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/accelerate[${PYTHON_USEDEP}]
	quantization? ( <=dev-python/bitsandbytes-0.41.1[${PYTHON_USEDEP}] )
	dev-python/datasets[${PYTHON_USEDEP}]
	benchmark? ( dev-python/deepspeed[${PYTHON_USEDEP}] )
	deepspeed? ( >=dev-python/deepspeed-0.14.4[${PYTHON_USEDEP}] )
	diffusers? ( >=dev-python/diffusers-0.18.0[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/ghapi[${PYTHON_USEDEP}] )
	llm-judge? ( >=dev-python/huggingface-hub-0.22.2[${PYTHON_USEDEP}] )
	liger? ( >=dev-python/liger-kernel-0.2.1[${PYTHON_USEDEP}] )
	llm-judge? ( >=dev-python/llm-blender-0.0.2[${PYTHON_USEDEP}] )
	llm-judge? ( >=dev-python/openai-1.23.2[${PYTHON_USEDEP}] )
	benchmark? ( ~dev-python/openrlbenchmark-0.2.1_alpha5[${PYTHON_USEDEP}] )
	peft? ( >=dev-python/peft-0.8.0[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/requests[${PYTHON_USEDEP}] )
	>=dev-python/torch-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/transformers-4.40.0[${PYTHON_USEDEP}]
	>=dev-python/tyro-0.5.11[${PYTHON_USEDEP}]
	benchmark? ( dev-python/wandb[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	<=dev-python/bitsandbytes-0.41.1[${PYTHON_USEDEP}]
	>=dev-python/deepspeed-0.14.4[${PYTHON_USEDEP}]
	>=dev-python/diffusers-0.18.0[${PYTHON_USEDEP}]
	dev-python/ghapi[${PYTHON_USEDEP}]
	>=dev-python/huggingface-hub-0.22.2[${PYTHON_USEDEP}]
	>=dev-python/liger-kernel-0.2.1[${PYTHON_USEDEP}]
	>=dev-python/llm-blender-0.0.2[${PYTHON_USEDEP}]
	>=dev-python/openai-1.23.2[${PYTHON_USEDEP}]
	~dev-python/openrlbenchmark-0.2.1_alpha5[${PYTHON_USEDEP}]
	dev-python/parameterized[${PYTHON_USEDEP}]
	>=dev-python/peft-0.8.0[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
	dev-python/pytest-xdist[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/scikit-learn[${PYTHON_USEDEP}]
	dev-python/wandb[${PYTHON_USEDEP}]
)"
