# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="recommended"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/geoviews/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/bokeh-3.6.0[${PYTHON_USEDEP}]
	>=dev-python/cartopy-0.18.0[${PYTHON_USEDEP}]
	recommended? ( dev-python/datashader[${PYTHON_USEDEP}] )
	recommended? ( dev-python/geopandas[${PYTHON_USEDEP}] )
	>=dev-python/holoviews-1.16.0[${PYTHON_USEDEP}]
	recommended? ( >dev-python/matplotlib-2.2[${PYTHON_USEDEP}] )
	recommended? ( dev-python/netcdf4[${PYTHON_USEDEP}] )
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	recommended? ( dev-python/pandas[${PYTHON_USEDEP}] )
	>=dev-python/panel-1.0.0[${PYTHON_USEDEP}]
	<dev-python/param-3.0[${PYTHON_USEDEP}]
	recommended? ( dev-python/pooch[${PYTHON_USEDEP}] )
	recommended? ( dev-python/pyct[${PYTHON_USEDEP}] )
	dev-python/pyproj[${PYTHON_USEDEP}]
	recommended? ( dev-python/scipy[${PYTHON_USEDEP}] )
	dev-python/shapely[${PYTHON_USEDEP}]
	recommended? ( dev-python/shapely[${PYTHON_USEDEP}] )
	recommended? ( dev-python/xarray[${PYTHON_USEDEP}] )
	dev-python/xyzservices[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-xdist[${PYTHON_USEDEP}]
)"
