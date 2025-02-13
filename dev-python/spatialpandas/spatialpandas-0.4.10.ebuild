# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="examples"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/spatialpandas/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/dask[${PYTHON_USEDEP}]
	examples? ( dev-python/datashader[${PYTHON_USEDEP}] )
	examples? ( dev-python/descartes[${PYTHON_USEDEP}] )
	examples? ( dev-python/distributed[${PYTHON_USEDEP}] )
	dev-python/fsspec[${PYTHON_USEDEP}]
	examples? ( dev-python/geopandas[${PYTHON_USEDEP}] )
	examples? ( dev-python/holoviews[${PYTHON_USEDEP}] )
	examples? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	dev-python/numba[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/param[${PYTHON_USEDEP}]
	>=dev-python/pyarrow-1.0[${PYTHON_USEDEP}]
	dev-python/retrying[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/codecov[${PYTHON_USEDEP}]
	dev-python/flake8[${PYTHON_USEDEP}]
	dev-python/geopandas[${PYTHON_USEDEP}]
	dev-python/hilbertcurve[${PYTHON_USEDEP}]
	dev-python/hypothesis[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}]
	dev-python/moto[s3,server,${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/python-snappy[${PYTHON_USEDEP}]
	dev-python/rfc3986[${PYTHON_USEDEP}]
	dev-python/s3fs[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/shapely[${PYTHON_USEDEP}]
	dev-python/twine[${PYTHON_USEDEP}]
)"
