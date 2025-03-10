# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="datasets test tokenizers transformers visualization"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/stanza/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	check-manifest; extra == 'dev'
	coverage; extra == 'test'
	datasets; extra == 'datasets'
	emoji
	ipython; extra == 'visualization'
	jieba; extra == 'tokenizers'
	networkx
	numpy
	peft>=0.6.1; extra == 'transformers'
	protobuf>=3.15.0
	pytest; extra == 'test'
	pythainlp; extra == 'tokenizers'
	python-crfsuite; extra == 'tokenizers'
	requests
	spacy; extra == 'tokenizers'
	spacy; extra == 'visualization'
	streamlit; extra == 'visualization'
	sudachidict_core; extra == 'tokenizers'
	sudachipy; extra == 'tokenizers'
	tomli; python_version < '3.11'
	torch>=1.3.0
	tqdm
	transformers>=3.0.0; extra == 'transformers'
"
GENERATED_RDEPEND="${RDEPEND}
	datasets? ( dev-python/datasets[${PYTHON_USEDEP}] )
	dev-python/emoji[${PYTHON_USEDEP}]
	visualization? ( dev-python/ipython[${PYTHON_USEDEP}] )
	tokenizers? ( dev-python/jieba[${PYTHON_USEDEP}] )
	dev-python/networkx[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	transformers? ( >=dev-python/peft-0.6.1[${PYTHON_USEDEP}] )
	>=dev-python/protobuf-3.15.0[${PYTHON_USEDEP}]
	tokenizers? ( dev-python/pythainlp[${PYTHON_USEDEP}] )
	tokenizers? ( dev-python/python-crfsuite[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	tokenizers? ( dev-python/spacy[${PYTHON_USEDEP}] )
	visualization? ( dev-python/spacy[${PYTHON_USEDEP}] )
	visualization? ( dev-python/streamlit[${PYTHON_USEDEP}] )
	tokenizers? ( dev-python/sudachidict-core[${PYTHON_USEDEP}] )
	tokenizers? ( dev-python/sudachipy[${PYTHON_USEDEP}] )
	>=dev-python/torch-1.3.0[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	transformers? ( >=dev-python/transformers-3.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/check-manifest[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
