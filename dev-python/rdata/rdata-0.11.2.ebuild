# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs test typing"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/rdata/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	igraph ; extra == 'docs'
	ipywidgets ; extra == 'docs'
	jupyterlite-pyodide-kernel ; extra == 'docs'
	jupyterlite-sphinx ; extra == 'docs'
	matplotlib ; extra == 'docs'
	matplotlib >=3.8 ; extra == 'typing'
	mypy ; extra == 'typing'
	myst-parser ; extra == 'docs'
	numpy
	numpy >=1.14 ; extra == 'test'
	pandas
	pandas-stubs ; extra == 'typing'
	pydata-sphinx-theme ; extra == 'docs'
	pytest ; extra == 'test'
	pytest-cov ; extra == 'test'
	sphinx >=3.1 ; extra == 'docs'
	sphinx-codeautolink ; extra == 'docs'
	sphinx-gallery ; extra == 'docs'
	typing-extensions >4.4
	xarray
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/igraph[${PYTHON_USEDEP}] )
	docs? ( dev-python/ipywidgets[${PYTHON_USEDEP}] )
	docs? ( dev-python/jupyterlite-pyodide-kernel[${PYTHON_USEDEP}] )
	docs? ( dev-python/jupyterlite-sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	typing? ( >=dev-python/matplotlib-3.8[${PYTHON_USEDEP}] )
	typing? ( dev-python/mypy[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	typing? ( dev-python/pandas-stubs[${PYTHON_USEDEP}] )
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-3.1[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-codeautolink[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-gallery[${PYTHON_USEDEP}] )
	>dev-python/typing-extensions-4.4[${PYTHON_USEDEP}]
	dev-python/xarray[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/numpy-1.14[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
