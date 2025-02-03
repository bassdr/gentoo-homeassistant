# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="code-style pdfhtml sphinx"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jupyter-book/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	sphinx? ( dev-python/altair[${PYTHON_USEDEP}] )
	sphinx? ( dev-python/bokeh[${PYTHON_USEDEP}] )
	<dev-python/click-9[${PYTHON_USEDEP}]
	sphinx? ( dev-python/folium[${PYTHON_USEDEP}] )
	sphinx? ( dev-python/ipywidgets[${PYTHON_USEDEP}] )
	dev-python/jinja2[${PYTHON_USEDEP}]
	<dev-python/jsonschema-5[${PYTHON_USEDEP}]
	sphinx? ( dev-python/jupytext[${PYTHON_USEDEP}] )
	<dev-python/linkify-it-py-3[${PYTHON_USEDEP}]
	sphinx? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	<dev-python/myst-nb-3[${PYTHON_USEDEP}]
	<dev-python/myst-parser-3[${PYTHON_USEDEP}]
	sphinx? ( dev-python/nbclient[${PYTHON_USEDEP}] )
	sphinx? ( >=dev-python/numpy-2[${PYTHON_USEDEP}] )
	sphinx? ( dev-python/pandas[${PYTHON_USEDEP}] )
	sphinx? ( dev-python/plotly[${PYTHON_USEDEP}] )
	pdfhtml? ( dev-python/pyppeteer[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	<dev-python/sphinx-8[${PYTHON_USEDEP}]
	<dev-python/sphinx-book-theme-2[${PYTHON_USEDEP}]
	sphinx? ( dev-python/sphinx-click[${PYTHON_USEDEP}] )
	dev-python/sphinx-comments[${PYTHON_USEDEP}]
	dev-python/sphinx-copybutton[${PYTHON_USEDEP}]
	<dev-python/sphinx-design-1[${PYTHON_USEDEP}]
	sphinx? ( dev-python/sphinx-examples[${PYTHON_USEDEP}] )
	<dev-python/sphinx-external-toc-2[${PYTHON_USEDEP}]
	sphinx? ( dev-python/sphinx-inline-tabs[${PYTHON_USEDEP}] )
	<dev-python/sphinx-jupyterbook-latex-2[${PYTHON_USEDEP}]
	<dev-python/sphinx-multitoc-numbering-1[${PYTHON_USEDEP}]
	sphinx? ( dev-python/sphinx-proof[${PYTHON_USEDEP}] )
	<dev-python/sphinx-thebe-1[${PYTHON_USEDEP}]
	dev-python/sphinx-togglebutton[${PYTHON_USEDEP}]
	<dev-python/sphinxcontrib-bibtex-3[${PYTHON_USEDEP}]
	sphinx? ( >=dev-python/sphinxext-rediraffe-0.2.3[${PYTHON_USEDEP}] =dev-python/sphinxext-rediraffe-0.2*[${PYTHON_USEDEP}] )
	sphinx? ( dev-python/sympy[${PYTHON_USEDEP}] )
	code-style? ( >=dev-vcs/pre-commit-3.1[${PYTHON_USEDEP}] =dev-vcs/pre-commit-3*[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/altair[${PYTHON_USEDEP}]
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/cookiecutter[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/jupytext[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		>=dev-python/numpy-2[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		>=dev-python/pydata-sphinx-theme-0.15.3[${PYTHON_USEDEP}]
		dev-python/pyppeteer[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.2.4[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/sphinx-click[${PYTHON_USEDEP}]
		dev-python/sphinx-inline-tabs[${PYTHON_USEDEP}]
		dev-python/texsoup[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
