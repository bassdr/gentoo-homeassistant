# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="parallel test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/prophet/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	cmdstanpy>=1.0.4
	dask[dataframe]; extra == 'parallel'
	distributed; extra == 'parallel'
	holidays<1,>=0.25
	importlib-resources
	jupyterlab; extra == 'dev'
	matplotlib>=2.0.0
	nbconvert; extra == 'dev'
	numpy>=1.15.4
	pandas>=1.0.4
	plotly; extra == 'dev'
	pytest; extra == 'dev'
	setuptools>=64; extra == 'dev'
	tqdm>=4.36.1
	wheel; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cmdstanpy-1.0.4[${PYTHON_USEDEP}]
	parallel? ( dev-python/dask[dataframe,${PYTHON_USEDEP}] )
	parallel? ( dev-python/distributed[${PYTHON_USEDEP}] )
	>=dev-python/holidays-0.25[${PYTHON_USEDEP}] <dev-python/holidays-1[${PYTHON_USEDEP}]
	dev-python/importlib-resources[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.15.4[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.0.4[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.36.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/jupyterlab[${PYTHON_USEDEP}]
		dev-python/nbconvert[${PYTHON_USEDEP}]
		dev-python/plotly[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		>=dev-python/setuptools-64[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
