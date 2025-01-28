# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all dashboard deep-learning spark"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/salesforce-merlion/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	all? ( >=dev-python/dash-2.4[diskcache,${PYTHON_USEDEP}] )
	dashboard? ( >=dev-python/dash-2.4[diskcache,${PYTHON_USEDEP}] )
	all? ( >=dev-python/dash-bootstrap-components-1.0[${PYTHON_USEDEP}] )
	dashboard? ( >=dev-python/dash-bootstrap-components-1.0[${PYTHON_USEDEP}] )
	dev-python/dill[${PYTHON_USEDEP}]
	all? ( dev-python/diskcache[${PYTHON_USEDEP}] )
	dashboard? ( dev-python/diskcache[${PYTHON_USEDEP}] )
	all? ( >=dev-python/einops-0.4.0[${PYTHON_USEDEP}] )
	deep-learning? ( >=dev-python/einops-0.4.0[${PYTHON_USEDEP}] )
	dev-python/gitpython[${PYTHON_USEDEP}]
	dev-python/lightgbm[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	<dev-python/numpy-2.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/plotly-4.13[${PYTHON_USEDEP}]
	>=dev-python/prophet-1.1[${PYTHON_USEDEP}]
	dev-python/py4j[${PYTHON_USEDEP}]
	all? ( >=dev-python/pyspark-3[sql,${PYTHON_USEDEP}] )
	spark? ( >=dev-python/pyspark-3[sql,${PYTHON_USEDEP}] )
	>=dev-python/scikit-learn-0.22[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/statsmodels-0.12.2[${PYTHON_USEDEP}]
	all? ( >=dev-python/torch-1.9.0[${PYTHON_USEDEP}] )
	deep-learning? ( >=dev-python/torch-1.9.0[${PYTHON_USEDEP}] )
	dev-python/tqdm[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest