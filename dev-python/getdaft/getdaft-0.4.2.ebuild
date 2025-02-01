# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all aws deltalake hudi iceberg lance numpy pandas ray sql unity"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/getdaft/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	aws? ( dev-python/boto3[${PYTHON_USEDEP}] )
	sql? ( dev-python/connectorx[${PYTHON_USEDEP}] )
	deltalake? ( dev-python/deltalake[${PYTHON_USEDEP}] )
	dev-python/fsspec[${PYTHON_USEDEP}]
	all? ( dev-python/getdaft[aws,azure,deltalake,gcp,iceberg,numpy,pandas,ray,sql,unity,${PYTHON_USEDEP}] )
	lance? ( dev-python/lancedb[${PYTHON_USEDEP}] )
	numpy? ( dev-python/numpy[${PYTHON_USEDEP}] )
	iceberg? ( dev-python/packaging[${PYTHON_USEDEP}] )
	ray? ( dev-python/packaging[${PYTHON_USEDEP}] )
	pandas? ( dev-python/pandas[${PYTHON_USEDEP}] )
	>=dev-python/pyarrow-8.0.0[${PYTHON_USEDEP}]
	hudi? ( >=dev-python/pyarrow-8.0.0[${PYTHON_USEDEP}] )
	iceberg? ( >=dev-python/pyiceberg-0.4.0[${PYTHON_USEDEP}] )
	sql? ( dev-python/sqlalchemy[${PYTHON_USEDEP}] )
	sql? ( dev-python/sqlglot[${PYTHON_USEDEP}] )
	dev-python/tqdm[${PYTHON_USEDEP}]
	unity? ( dev-python/unitycatalog[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
