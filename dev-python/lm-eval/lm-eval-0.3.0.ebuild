# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="multilingual"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/lm-eval/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	black ; extra == 'dev'
	datasets (>=2.0.0)
	flake8 ; extra == 'dev'
	jieba (>=0.42.1) ; extra == 'multilingual'
	jsonlines
	nagisa (>=0.2.7) ; extra == 'multilingual'
	numexpr
	openai (>=0.6.4)
	pre-commit ; extra == 'dev'
	pybind11 (>=2.6.2)
	pycountry
	pytablewriter
	pytest ; extra == 'dev'
	pytest-cov ; extra == 'dev'
	rouge-score (>=0.0.4)
	sacrebleu (==1.5.0)
	scikit-learn (>=0.24.1)
	sqlitedict
	torch (>=1.7)
	tqdm-multiprocess
	transformers (>=4.1)
	zstandard
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/datasets-2.0.0[${PYTHON_USEDEP}]
	multilingual? ( >=dev-python/jieba-0.42.1[${PYTHON_USEDEP}] )
	dev-python/jsonlines[${PYTHON_USEDEP}]
	multilingual? ( >=dev-python/nagisa-0.2.7[${PYTHON_USEDEP}] )
	dev-python/numexpr[${PYTHON_USEDEP}]
	>=dev-python/openai-0.6.4[${PYTHON_USEDEP}]
	>=dev-python/pybind11-2.6.2[${PYTHON_USEDEP}]
	dev-python/pycountry[${PYTHON_USEDEP}]
	dev-python/pytablewriter[${PYTHON_USEDEP}]
	>=dev-python/rouge-score-0.0.4[${PYTHON_USEDEP}]
	~dev-python/sacrebleu-1.5.0[${PYTHON_USEDEP}]
	>=dev-python/scikit-learn-0.24.1[${PYTHON_USEDEP}]
	dev-python/sqlitedict[${PYTHON_USEDEP}]
	>=dev-python/torch-1.7[${PYTHON_USEDEP}]
	dev-python/tqdm-multiprocess[${PYTHON_USEDEP}]
	>=dev-python/transformers-4.1[${PYTHON_USEDEP}]
	dev-python/zstandard[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
