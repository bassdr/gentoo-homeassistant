# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="cli code-style rtd test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jupyter-cache/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	attrs
	click
	click-log; extra == 'cli'
	coverage; extra == 'testing'
	importlib-metadata
	ipykernel; extra == 'rtd'
	ipykernel; extra == 'testing'
	jupytext; extra == 'rtd'
	jupytext; extra == 'testing'
	matplotlib; extra == 'testing'
	myst-nb; extra == 'rtd'
	nbclient>=0.2
	nbdime; extra == 'rtd'
	nbdime; extra == 'testing'
	nbformat
	nbformat>=5.1; extra == 'testing'
	numpy; extra == 'testing'
	pandas; extra == 'testing'
	pre-commit>=2.12; extra == 'code-style'
	pytest-cov; extra == 'testing'
	pytest-regressions; extra == 'testing'
	pytest>=6; extra == 'testing'
	pyyaml
	sphinx-book-theme; extra == 'rtd'
	sphinx-copybutton; extra == 'rtd'
	sqlalchemy<3,>=1.3.12
	sympy; extra == 'testing'
	tabulate
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/attrs[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	cli? ( dev-python/click-log[${PYTHON_USEDEP}] )
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	rtd? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	rtd? ( dev-python/jupytext[${PYTHON_USEDEP}] )
	rtd? ( dev-python/myst-nb[${PYTHON_USEDEP}] )
	>=dev-python/nbclient-0.2[${PYTHON_USEDEP}]
	rtd? ( dev-python/nbdime[${PYTHON_USEDEP}] )
	dev-python/nbformat[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	rtd? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	>=dev-python/sqlalchemy-1.3.12[${PYTHON_USEDEP}] <dev-python/sqlalchemy-3[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	code-style? ( >=dev-vcs/pre-commit-2.12[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/ipykernel[${PYTHON_USEDEP}]
		dev-python/jupytext[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/nbdime[${PYTHON_USEDEP}]
		>=dev-python/nbformat-5.1[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		>=dev-python/pytest-6[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
		dev-python/sympy[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
