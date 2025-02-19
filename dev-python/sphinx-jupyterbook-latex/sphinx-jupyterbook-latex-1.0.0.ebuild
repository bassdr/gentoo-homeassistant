# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="code_style myst rtd test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-jupyterbook-latex/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	coverage>=6.0 ; extra == 'testing'
	myst-nb>=1.0.0 ; extra == 'myst'
	myst-nb>=1.0.0 ; extra == 'testing'
	myst-parser ; extra == 'rtd'
	packaging
	pre-commit~=2.12 ; extra == 'code_style'
	pytest-cov>=3 ; extra == 'testing'
	pytest-regressions ; extra == 'testing'
	pytest>=7.1 ; extra == 'testing'
	sphinx-book-theme ; extra == 'rtd'
	sphinx-design ; extra == 'rtd'
	sphinx-external-toc>=1.0.0 ; extra == 'testing'
	sphinx-jupyterbook-latex ; extra == 'rtd'
	sphinx>=5
	sphinxcontrib-bibtex>=2.6.0 ; extra == 'testing'
	texsoup ; extra == 'testing'
"
GENERATED_RDEPEND="${RDEPEND}
	myst? ( >=dev-python/myst-nb-1.0.0[${PYTHON_USEDEP}] )
	rtd? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/sphinx-5[${PYTHON_USEDEP}]
	rtd? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-jupyterbook-latex[${PYTHON_USEDEP}] )
	code_style? ( >=dev-vcs/pre-commit-2.12[${PYTHON_USEDEP}] =dev-vcs/pre-commit-2*[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-6.0[${PYTHON_USEDEP}]
		>=dev-python/myst-nb-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-3[${PYTHON_USEDEP}]
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
		>=dev-python/sphinx-external-toc-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/sphinxcontrib-bibtex-2.6.0[${PYTHON_USEDEP}]
		dev-python/texsoup[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
