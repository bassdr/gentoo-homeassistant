# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="array complete dataframe diagnostics distributed"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dask/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	diagnostics? ( >=dev-python/bokeh-3.1.0[${PYTHON_USEDEP}] )
	>=dev-python/click-8.1[${PYTHON_USEDEP}]
	>=dev-python/cloudpickle-3.0.0[${PYTHON_USEDEP}]
	complete? ( dev-python/dask[array,dataframe,diagnostics,distributed,${PYTHON_USEDEP}] )
	dataframe? ( dev-python/dask[array,${PYTHON_USEDEP}] )
	distributed? ( ~dev-python/distributed-2025.1.0[${PYTHON_USEDEP}] )
	>=dev-python/fsspec-2021.09.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/importlib-metadata-4.13.0[${PYTHON_USEDEP}]' python3_12)
	diagnostics? ( >=dev-python/jinja2-2.10.3[${PYTHON_USEDEP}] )
	complete? ( >=dev-python/lz4-4.3.2[${PYTHON_USEDEP}] )
	array? ( >=dev-python/numpy-1.24[${PYTHON_USEDEP}] )
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	dataframe? ( >=dev-python/pandas-2.0[${PYTHON_USEDEP}] )
	>=dev-python/partd-1.4.0[${PYTHON_USEDEP}]
	complete? ( >=dev-python/pyarrow-14.0.1[${PYTHON_USEDEP}] )
	dataframe? ( >=dev-python/pyarrow-14.0.1[${PYTHON_USEDEP}] )
	>=dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}]
	>=dev-python/toolz-0.10.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/pandas[test,${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/pytest-mock[${PYTHON_USEDEP}]
	dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
	dev-python/pytest-timeout[${PYTHON_USEDEP}]
	dev-python/pytest-xdist[${PYTHON_USEDEP}]
	dev-vcs/pre-commit[${PYTHON_USEDEP}]
)"
