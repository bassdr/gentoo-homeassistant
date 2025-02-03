# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs plus"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/libpysal/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/beautifulsoup4-4.10[${PYTHON_USEDEP}]
	>=dev-python/geopandas-0.10.0[${PYTHON_USEDEP}]
	plus? ( >=dev-python/joblib-1.2[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	docs? ( dev-python/nbsphinx[${PYTHON_USEDEP}] )
	plus? ( >=dev-python/networkx-2.7[${PYTHON_USEDEP}] )
	plus? ( >=dev-python/numba-0.55[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.22[${PYTHON_USEDEP}]
	docs? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	>=dev-python/packaging-22[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.4[${PYTHON_USEDEP}]
	docs? ( dev-python/pandoc[${PYTHON_USEDEP}] )
	>=dev-python/platformdirs-2.0.2[${PYTHON_USEDEP}]
	plus? ( >=dev-python/pyarrow-7.0[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.27[${PYTHON_USEDEP}]
	>=dev-python/scikit-learn-1.1[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.8[${PYTHON_USEDEP}]
	>=dev-python/shapely-2.0.1[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-bootstrap-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-bibtex[${PYTHON_USEDEP}] )
	plus? ( >=dev-python/sqlalchemy-2.0[${PYTHON_USEDEP}] )
	plus? ( >=dev-python/xarray-2022.3[${PYTHON_USEDEP}] )
	plus? ( dev-python/zstd[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/codecov[${PYTHON_USEDEP}]
		>=dev-python/geodatasets-2023.3.0[${PYTHON_USEDEP}]
		>=dev-python/matplotlib-3.6[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mpl[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
		dev-python/watermark[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
