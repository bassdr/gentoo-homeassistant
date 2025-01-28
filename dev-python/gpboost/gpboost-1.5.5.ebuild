# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="dask"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/gpboost/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dask? ( >=dev-python/dask-2.0.0[array,${PYTHON_USEDEP}] )
	dask? ( >=dev-python/dask-2.0.0[dataframe,${PYTHON_USEDEP}] )
	dask? ( >=dev-python/dask-2.0.0[distributed,${PYTHON_USEDEP}] )
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/optuna[${PYTHON_USEDEP}]
	dask? ( dev-python/pandas[${PYTHON_USEDEP}] )
	dev-python/pandas[${PYTHON_USEDEP}]
	!=dev-python/scikit-learn-0.22.0[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest