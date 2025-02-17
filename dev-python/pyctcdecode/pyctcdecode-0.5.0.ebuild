# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyctcdecode/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	bandit ; extra == 'dev'
	black ; extra == 'dev'
	codecov ; extra == 'dev'
	flake8 ; extra == 'dev'
	huggingface-hub ; extra == 'dev'
	hypothesis (<7,>=6.14)
	importlib-metadata (<5) ; python_version == '3.7'
	isort (<6,>=5.0.0) ; extra == 'dev'
	jupyter ; extra == 'dev'
	mypy ; extra == 'dev'
	nbconvert ; extra == 'dev'
	nbformat ; extra == 'dev'
	numpy (<2.0.0,>=1.15.0)
	pydocstyle ; extra == 'dev'
	pygtrie (<3.0,>=2.1)
	pylint ; extra == 'dev'
	pytest ; extra == 'dev'
	pytest-cov ; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/hypothesis-6.14[${PYTHON_USEDEP}] <dev-python/hypothesis-7[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.15.0[${PYTHON_USEDEP}] <dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pygtrie-2.1[${PYTHON_USEDEP}] <dev-python/pygtrie-3.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/bandit[${PYTHON_USEDEP}]
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/codecov[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/huggingface-hub[${PYTHON_USEDEP}]
		>=dev-python/isort-5.0.0[${PYTHON_USEDEP}] <dev-python/isort-6[${PYTHON_USEDEP}]
		dev-python/jupyter[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/nbconvert[${PYTHON_USEDEP}]
		dev-python/nbformat[${PYTHON_USEDEP}]
		dev-python/pydocstyle[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
