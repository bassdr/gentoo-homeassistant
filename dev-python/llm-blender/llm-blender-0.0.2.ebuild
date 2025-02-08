# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="data eval example train"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/llm-blender/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	accelerate
	bert-score; extra == "eval"
	bitsandbytes; extra == "train"
	dataclasses-json
	datasets; extra == "data"
	datasets; extra == "eval"
	datasets; extra == "example"
	datasets; extra == "train"
	deepspeed; extra == "train"
	evaluate; extra == "eval"
	fschat; extra == "data"
	jupyter; extra == "example"
	nltk; extra == "eval"
	numpy
	openai; extra == "data"
	peft; extra == "data"
	prettytable; extra == "eval"
	protobuf
	pycocoevalcap; extra == "eval"
	rouge-score; extra == "eval"
	sacrebleu; extra == "eval"
	safetensors
	scikit-learn; extra == "eval"
	scipy; extra == "eval"
	scipy; extra == "example"
	sentencepiece
	spacy; extra == "eval"
	tabulate; extra == "eval"
	torch
	transformers
	wandb; extra == "train"
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/accelerate[${PYTHON_USEDEP}]
	eval? ( dev-python/bert-score[${PYTHON_USEDEP}] )
	train? ( dev-python/bitsandbytes[${PYTHON_USEDEP}] )
	dev-python/dataclasses-json[${PYTHON_USEDEP}]
	data? ( dev-python/datasets[${PYTHON_USEDEP}] )
	eval? ( dev-python/datasets[${PYTHON_USEDEP}] )
	example? ( dev-python/datasets[${PYTHON_USEDEP}] )
	train? ( dev-python/datasets[${PYTHON_USEDEP}] )
	train? ( dev-python/deepspeed[${PYTHON_USEDEP}] )
	eval? ( dev-python/evaluate[${PYTHON_USEDEP}] )
	data? ( dev-python/fschat[${PYTHON_USEDEP}] )
	example? ( dev-python/jupyter[${PYTHON_USEDEP}] )
	eval? ( dev-python/nltk[${PYTHON_USEDEP}] )
	dev-python/numpy[${PYTHON_USEDEP}]
	data? ( dev-python/openai[${PYTHON_USEDEP}] )
	data? ( dev-python/peft[${PYTHON_USEDEP}] )
	eval? ( dev-python/prettytable[${PYTHON_USEDEP}] )
	dev-python/protobuf[${PYTHON_USEDEP}]
	eval? ( dev-python/pycocoevalcap[${PYTHON_USEDEP}] )
	eval? ( dev-python/rouge-score[${PYTHON_USEDEP}] )
	eval? ( dev-python/sacrebleu[${PYTHON_USEDEP}] )
	dev-python/safetensors[${PYTHON_USEDEP}]
	eval? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	eval? ( dev-python/scipy[${PYTHON_USEDEP}] )
	example? ( dev-python/scipy[${PYTHON_USEDEP}] )
	dev-python/sentencepiece[${PYTHON_USEDEP}]
	eval? ( dev-python/spacy[${PYTHON_USEDEP}] )
	eval? ( dev-python/tabulate[${PYTHON_USEDEP}] )
	dev-python/torch[${PYTHON_USEDEP}]
	dev-python/transformers[${PYTHON_USEDEP}]
	train? ( dev-python/wandb[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
