# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all dask"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/qpd/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	dev-python/adagio[${PYTHON_USEDEP}]
	<dev-python/antlr4-python3-runtime-4.12[${PYTHON_USEDEP}]
	all? ( >=dev-python/cloudpickle-1.4.0[${PYTHON_USEDEP}] )
	dask? ( >=dev-python/cloudpickle-1.4.0[${PYTHON_USEDEP}] )
	all? ( dev-python/dask[dataframe,distributed,${PYTHON_USEDEP}] )
	dask? ( dev-python/dask[dataframe,distributed,${PYTHON_USEDEP}] )
	>=dev-python/pandas-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/triad-0.9.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
