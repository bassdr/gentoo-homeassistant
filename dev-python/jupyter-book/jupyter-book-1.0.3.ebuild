# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="code-style pdfhtml sphinx test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jupyter-book/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Jinja2
	altair; extra == 'sphinx'
	altair; extra == 'testing'
	beautifulsoup4; extra == 'testing'
	bokeh; extra == 'sphinx'
	click<9,>=7.1
	cookiecutter; extra == 'testing'
	coverage; extra == 'testing'
	folium; extra == 'sphinx'
	ipywidgets; extra == 'sphinx'
	jsonschema<5
	jupytext; extra == 'sphinx'
	jupytext; extra == 'testing'
	linkify-it-py<3,>=2
	matplotlib; extra == 'sphinx'
	matplotlib; extra == 'testing'
	myst-nb<3,>=1
	myst-parser<3,>=1
	nbclient; extra == 'sphinx'
	numpy>=2; extra == 'sphinx'
	numpy>=2; extra == 'testing'
	pandas; extra == 'sphinx'
	pandas; extra == 'testing'
	plotly; extra == 'sphinx'
	pre-commit~=3.1; extra == 'code-style'
	pydata-sphinx-theme>=0.15.3; extra == 'testing'
	pyppeteer; extra == 'pdfhtml'
	pyppeteer; extra == 'testing'
	pytest-cov; extra == 'testing'
	pytest-regressions; extra == 'testing'
	pytest-timeout; extra == 'testing'
	pytest-xdist; extra == 'testing'
	pytest>=6.2.4; extra == 'testing'
	pyyaml
	sphinx-book-theme<2,>=1.1.0
	sphinx-click; extra == 'sphinx'
	sphinx-comments
	sphinx-copybutton
	sphinx-design<1,>=0.5
	sphinx-examples; extra == 'sphinx'
	sphinx-external-toc<2,>=1.0.1
	sphinx-jupyterbook-latex<2,>=1
	sphinx-multitoc-numbering<1,>=0.1.3
	sphinx-proof; extra == 'sphinx'
	sphinx-thebe<1,>=0.3.1
	sphinx<8,>=5
	sphinx_click; extra == 'testing'
	sphinx_inline_tabs; extra == 'sphinx'
	sphinx_inline_tabs; extra == 'testing'
	sphinx_togglebutton
	sphinxcontrib-bibtex<3,>=2.5.0
	sphinxext-rediraffe~=0.2.3; extra == 'sphinx'
	sympy; extra == 'sphinx'
	texsoup; extra == 'testing'
"
GENERATED_RDEPEND="${RDEPEND}
	sphinx? ( dev-python/altair[${PYTHON_USEDEP}] )
	sphinx? ( dev-python/bokeh[${PYTHON_USEDEP}] )
	>=dev-python/click-7.1[${PYTHON_USEDEP}] <dev-python/click-9[${PYTHON_USEDEP}]
	sphinx? ( dev-python/folium[${PYTHON_USEDEP}] )
	sphinx? ( dev-python/ipywidgets[${PYTHON_USEDEP}] )
	dev-python/jinja2[${PYTHON_USEDEP}]
	<dev-python/jsonschema-5[${PYTHON_USEDEP}]
	sphinx? ( dev-python/jupytext[${PYTHON_USEDEP}] )
	>=dev-python/linkify-it-py-2[${PYTHON_USEDEP}] <dev-python/linkify-it-py-3[${PYTHON_USEDEP}]
	sphinx? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	>=dev-python/myst-nb-1[${PYTHON_USEDEP}] <dev-python/myst-nb-3[${PYTHON_USEDEP}]
	>=dev-python/myst-parser-1[${PYTHON_USEDEP}] <dev-python/myst-parser-3[${PYTHON_USEDEP}]
	sphinx? ( dev-python/nbclient[${PYTHON_USEDEP}] )
	sphinx? ( >=dev-python/numpy-2[${PYTHON_USEDEP}] )
	sphinx? ( dev-python/pandas[${PYTHON_USEDEP}] )
	sphinx? ( dev-python/plotly[${PYTHON_USEDEP}] )
	pdfhtml? ( dev-python/pyppeteer[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/sphinx-5[${PYTHON_USEDEP}] <dev-python/sphinx-8[${PYTHON_USEDEP}]
	>=dev-python/sphinx-book-theme-1.1.0[${PYTHON_USEDEP}] <dev-python/sphinx-book-theme-2[${PYTHON_USEDEP}]
	sphinx? ( dev-python/sphinx-click[${PYTHON_USEDEP}] )
	dev-python/sphinx-comments[${PYTHON_USEDEP}]
	dev-python/sphinx-copybutton[${PYTHON_USEDEP}]
	>=dev-python/sphinx-design-0.5[${PYTHON_USEDEP}] <dev-python/sphinx-design-1[${PYTHON_USEDEP}]
	sphinx? ( dev-python/sphinx-examples[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-external-toc-1.0.1[${PYTHON_USEDEP}] <dev-python/sphinx-external-toc-2[${PYTHON_USEDEP}]
	sphinx? ( dev-python/sphinx-inline-tabs[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-jupyterbook-latex-1[${PYTHON_USEDEP}] <dev-python/sphinx-jupyterbook-latex-2[${PYTHON_USEDEP}]
	>=dev-python/sphinx-multitoc-numbering-0.1.3[${PYTHON_USEDEP}] <dev-python/sphinx-multitoc-numbering-1[${PYTHON_USEDEP}]
	sphinx? ( dev-python/sphinx-proof[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-thebe-0.3.1[${PYTHON_USEDEP}] <dev-python/sphinx-thebe-1[${PYTHON_USEDEP}]
	dev-python/sphinx-togglebutton[${PYTHON_USEDEP}]
	>=dev-python/sphinxcontrib-bibtex-2.5.0[${PYTHON_USEDEP}] <dev-python/sphinxcontrib-bibtex-3[${PYTHON_USEDEP}]
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
