# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all docs tests tox"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sparse/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	tests? ( dev-python/dask[array,${PYTHON_USEDEP}] )
	all? ( dev-python/matrepr[${PYTHON_USEDEP}] )
	>=dev-python/numba-0.49[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.17[${PYTHON_USEDEP}]
	tests? ( >=dev-python/pytest-3.5[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	>=dev-python/scipy-0.19[${PYTHON_USEDEP}]
	all? ( dev-python/sparse[docs,tox,${PYTHON_USEDEP}] )
	tox? ( dev-python/sparse[tests,${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	tox? ( dev-python/tox[${PYTHON_USEDEP}] )
	tests? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest