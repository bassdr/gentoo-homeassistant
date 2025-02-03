# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all corenlp machine-learning plot tgrep twitter"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/nltk/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/joblib[${PYTHON_USEDEP}]
	all? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	plot? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	all? ( dev-python/numpy[${PYTHON_USEDEP}] )
	machine-learning? ( dev-python/numpy[${PYTHON_USEDEP}] )
	all? ( dev-python/pyparsing[${PYTHON_USEDEP}] )
	tgrep? ( dev-python/pyparsing[${PYTHON_USEDEP}] )
	all? ( dev-python/python-crfsuite[${PYTHON_USEDEP}] )
	machine-learning? ( dev-python/python-crfsuite[${PYTHON_USEDEP}] )
	>=dev-python/regex-2021.8.3[${PYTHON_USEDEP}]
	all? ( dev-python/requests[${PYTHON_USEDEP}] )
	corenlp? ( dev-python/requests[${PYTHON_USEDEP}] )
	all? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	machine-learning? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	all? ( dev-python/scipy[${PYTHON_USEDEP}] )
	machine-learning? ( dev-python/scipy[${PYTHON_USEDEP}] )
	dev-python/tqdm[${PYTHON_USEDEP}]
	all? ( dev-python/twython[${PYTHON_USEDEP}] )
	twitter? ( dev-python/twython[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
