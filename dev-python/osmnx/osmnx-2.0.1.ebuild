# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="entropy neighbors raster visualization"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/osmnx/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/geopandas-1.0[${PYTHON_USEDEP}]
	visualization? ( >=dev-python/matplotlib-3.5[${PYTHON_USEDEP}] )
	>=dev-python/networkx-2.5[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.22[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.4[${PYTHON_USEDEP}]
	raster? ( >=dev-python/rasterio-1.3[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.27[${PYTHON_USEDEP}]
	raster? ( >=dev-python/rio-vrt-0.3[${PYTHON_USEDEP}] )
	neighbors? ( >=dev-python/scikit-learn-0.23[${PYTHON_USEDEP}] )
	entropy? ( >=dev-python/scipy-1.5[${PYTHON_USEDEP}] )
	neighbors? ( >=dev-python/scipy-1.5[${PYTHON_USEDEP}] )
	>=dev-python/shapely-2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
