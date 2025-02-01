# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="doc numba xarray"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/arviz-stats/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	xarray? ( ~dev-python/arviz-base-0.3.0[${PYTHON_USEDEP}] )
	doc? ( dev-python/jupyter-sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/myst-nb[${PYTHON_USEDEP}] )
	doc? ( dev-python/myst-parser[linkify,${PYTHON_USEDEP}] )
	doc? ( dev-python/netcdf4[${PYTHON_USEDEP}] )
	numba? ( dev-python/numba[${PYTHON_USEDEP}] )
	xarray? ( dev-python/numba[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
	doc? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	>=dev-python/scipy-1.10[${PYTHON_USEDEP}]
	doc? ( >=dev-python/sphinx-5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-autosummary-accessors[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	numba? ( dev-python/xarray-einstats[einops,${PYTHON_USEDEP}] )
	xarray? ( dev-python/xarray-einstats[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/h5netcdf[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
)"
