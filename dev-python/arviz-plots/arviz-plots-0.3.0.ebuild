# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="bokeh doc matplotlib plotly"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/arviz-plots/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	arviz-base==0.3.0
	arviz-stats[xarray]==0.3.0
	bokeh; extra == 'bokeh'
	h5netcdf; extra == 'doc'
	h5netcdf; extra == 'test'
	hypothesis; extra == 'test'
	jupyter-sphinx; extra == 'doc'
	matplotlib; extra == 'matplotlib'
	myst-nb; extra == 'doc'
	myst-parser[linkify]; extra == 'doc'
	numpydoc; extra == 'doc'
	plotly>5; extra == 'plotly'
	pytest-cov; extra == 'test'
	pytest; extra == 'test'
	sphinx-book-theme; extra == 'doc'
	sphinx-copybutton; extra == 'doc'
	sphinx-design; extra == 'doc'
	sphinx<8,>=5; extra == 'doc'
	webcolors; extra == 'plotly'
"
GENERATED_RDEPEND="${RDEPEND}
	~dev-python/arviz-base-0.3.0[${PYTHON_USEDEP}]
	~dev-python/arviz-stats-0.3.0[xarray,${PYTHON_USEDEP}]
	bokeh? ( dev-python/bokeh[${PYTHON_USEDEP}] )
	doc? ( dev-python/h5netcdf[${PYTHON_USEDEP}] )
	doc? ( dev-python/jupyter-sphinx[${PYTHON_USEDEP}] )
	matplotlib? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	doc? ( dev-python/myst-nb[${PYTHON_USEDEP}] )
	doc? ( dev-python/myst-parser[linkify,${PYTHON_USEDEP}] )
	doc? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	plotly? ( >dev-python/plotly-5[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-5[${PYTHON_USEDEP}] <dev-python/sphinx-8[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	plotly? ( dev-python/webcolors[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/h5netcdf[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
