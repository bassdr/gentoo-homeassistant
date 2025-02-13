# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all code-style rtd"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-proof/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	all? ( dev-python/beautifulsoup4[${PYTHON_USEDEP}] )
	all? ( dev-python/black[${PYTHON_USEDEP}] )
	code-style? ( dev-python/black[${PYTHON_USEDEP}] )
	all? ( dev-python/coverage[${PYTHON_USEDEP}] )
	all? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	>=dev-python/docutils-0.15[${PYTHON_USEDEP}]
	all? ( dev-python/flake8[${PYTHON_USEDEP}] )
	code-style? ( dev-python/flake8[${PYTHON_USEDEP}] )
	all? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	rtd? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	all? ( ~dev-python/pytest-7.1[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-regressions[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sphinx-5.0[${PYTHON_USEDEP}] )
	rtd? ( >=dev-python/sphinx-5.0[${PYTHON_USEDEP}] )
	all? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	all? ( dev-python/sphinx-togglebutton[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-togglebutton[${PYTHON_USEDEP}] )
	all? ( dev-python/sphinxcontrib-bibtex[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinxcontrib-bibtex[${PYTHON_USEDEP}] )
	all? ( dev-python/texsoup[${PYTHON_USEDEP}] )
	all? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
	code-style? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/coverage[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	dev-python/myst-parser[${PYTHON_USEDEP}]
	~dev-python/pytest-7.1[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/pytest-regressions[${PYTHON_USEDEP}]
	dev-python/texsoup[${PYTHON_USEDEP}]
)"
