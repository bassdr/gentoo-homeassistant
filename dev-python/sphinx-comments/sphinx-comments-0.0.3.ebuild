# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="code_style sphinx"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-comments/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	beautifulsoup4 ; extra == 'testing'
	black ; extra == 'code_style'
	flake8 (<3.8.0,>=3.7.0) ; extra == 'code_style'
	myst-parser ; extra == 'sphinx'
	myst-parser ; extra == 'testing'
	pre-commit (==1.17.0) ; extra == 'code_style'
	pytest ; extra == 'testing'
	pytest-regressions ; extra == 'testing'
	sphinx (>=1.8)
	sphinx (>=2) ; extra == 'sphinx'
	sphinx (>=2) ; extra == 'testing'
	sphinx-book-theme ; extra == 'sphinx'
	sphinx-book-theme ; extra == 'testing'
"
GENERATED_RDEPEND="${RDEPEND}
	code_style? ( dev-python/black[${PYTHON_USEDEP}] )
	code_style? ( >=dev-python/flake8-3.7.0[${PYTHON_USEDEP}] <dev-python/flake8-3.8.0[${PYTHON_USEDEP}] )
	sphinx? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-1.8[${PYTHON_USEDEP}]
	sphinx? ( >=dev-python/sphinx-2[${PYTHON_USEDEP}] )
	sphinx? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	code_style? ( ~dev-vcs/pre-commit-1.17.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/myst-parser[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
		>=dev-python/sphinx-2[${PYTHON_USEDEP}]
		dev-python/sphinx-book-theme[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
