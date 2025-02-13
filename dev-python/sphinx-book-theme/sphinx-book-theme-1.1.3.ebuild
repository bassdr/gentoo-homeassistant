# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="code-style doc test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-book-theme/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	doc? ( dev-python/ablog[${PYTHON_USEDEP}] )
	test? ( dev-python/beautifulsoup4[${PYTHON_USEDEP}] )
	test? ( dev-python/coverage[${PYTHON_USEDEP}] )
	test? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	doc? ( dev-python/folium[${PYTHON_USEDEP}] )
	doc? ( dev-python/ipywidgets[${PYTHON_USEDEP}] )
	doc? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	doc? ( dev-python/myst-nb[${PYTHON_USEDEP}] )
	test? ( dev-python/myst-nb[${PYTHON_USEDEP}] )
	doc? ( dev-python/nbclient[${PYTHON_USEDEP}] )
	doc? ( dev-python/numpy[${PYTHON_USEDEP}] )
	doc? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	doc? ( dev-python/pandas[${PYTHON_USEDEP}] )
	doc? ( dev-python/plotly[${PYTHON_USEDEP}] )
	>=dev-python/pydata-sphinx-theme-0.15.2[${PYTHON_USEDEP}]
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-regressions[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-5[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-examples[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-tabs[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-thebe[${PYTHON_USEDEP}] )
	test? ( dev-python/sphinx-thebe[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-togglebutton[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinxcontrib-bibtex[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinxcontrib-youtube[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinxext-opengraph[${PYTHON_USEDEP}] )
	code-style? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest