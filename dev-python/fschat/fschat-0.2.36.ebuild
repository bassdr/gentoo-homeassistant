# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="llm_judge model_worker test train webui"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fschat/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	accelerate >=0.21 ; extra == 'model_worker'
	aiohttp
	anthropic >=0.3 ; extra == 'llm_judge'
	black ==23.3.0 ; extra == 'dev'
	einops ; extra == 'train'
	fastapi
	flash-attn >=2.0 ; extra == 'train'
	gradio >=4.10 ; extra == 'webui'
	httpx
	markdown2[all]
	nh3
	numpy
	openai <1 ; extra == 'llm_judge'
	peft ; extra == 'model_worker'
	prompt-toolkit >=3.0.0
	protobuf ; extra == 'model_worker'
	pydantic
	pylint ==2.8.2 ; extra == 'dev'
	ray ; extra == 'llm_judge'
	requests
	rich >=10.0.0
	sentencepiece ; extra == 'model_worker'
	shortuuid
	tiktoken
	torch ; extra == 'model_worker'
	transformers >=4.31.0 ; extra == 'model_worker'
	uvicorn
	wandb ; extra == 'train'
"
GENERATED_RDEPEND="${RDEPEND}
	model_worker? ( >=dev-python/accelerate-0.21[${PYTHON_USEDEP}] )
	dev-python/aiohttp[${PYTHON_USEDEP}]
	llm_judge? ( >=dev-python/anthropic-0.3[${PYTHON_USEDEP}] )
	train? ( dev-python/einops[${PYTHON_USEDEP}] )
	dev-python/fastapi[${PYTHON_USEDEP}]
	train? ( >=dev-python/flash-attn-2.0[${PYTHON_USEDEP}] )
	webui? ( >=dev-python/gradio-4.10[${PYTHON_USEDEP}] )
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/markdown2[all,${PYTHON_USEDEP}]
	dev-python/nh3[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	llm_judge? ( <dev-python/openai-1[${PYTHON_USEDEP}] )
	model_worker? ( dev-python/peft[${PYTHON_USEDEP}] )
	>=dev-python/prompt-toolkit-3.0.0[${PYTHON_USEDEP}]
	model_worker? ( dev-python/protobuf[${PYTHON_USEDEP}] )
	dev-python/pydantic[${PYTHON_USEDEP}]
	llm_judge? ( dev-python/ray[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/rich-10.0.0[${PYTHON_USEDEP}]
	model_worker? ( dev-python/sentencepiece[${PYTHON_USEDEP}] )
	dev-python/shortuuid[${PYTHON_USEDEP}]
	dev-python/tiktoken[${PYTHON_USEDEP}]
	model_worker? ( dev-python/torch[${PYTHON_USEDEP}] )
	model_worker? ( >=dev-python/transformers-4.31.0[${PYTHON_USEDEP}] )
	dev-python/uvicorn[${PYTHON_USEDEP}]
	train? ( dev-python/wandb[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/black-23.3.0[${PYTHON_USEDEP}]
		~dev-python/pylint-2.8.2[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
