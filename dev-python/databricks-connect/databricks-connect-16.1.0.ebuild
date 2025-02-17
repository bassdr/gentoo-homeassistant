# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="connect ml mllib pandas-on-spark sql"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/databricks-connect/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	databricks-sdk>=0.29.0
	googleapis-common-protos>=1.56.4
	googleapis-common-protos>=1.56.4; extra == 'connect'
	grpcio-status>=1.59.3
	grpcio-status>=1.59.3; extra == 'connect'
	grpcio>=1.59.3
	grpcio>=1.59.3; extra == 'connect'
	numpy<2,>=1.15
	numpy<2,>=1.15; extra == 'connect'
	numpy<2,>=1.15; extra == 'ml'
	numpy<2,>=1.15; extra == 'mllib'
	numpy<2,>=1.15; extra == 'pandas-on-spark'
	numpy<2,>=1.15; extra == 'sql'
	packaging>=23.2
	pandas>=1.0.5
	pandas>=1.0.5; extra == 'connect'
	pandas>=1.0.5; extra == 'pandas-on-spark'
	pandas>=1.0.5; extra == 'sql'
	py4j==0.10.9.7
	pyarrow>=4.0.0
	pyarrow>=4.0.0; extra == 'connect'
	pyarrow>=4.0.0; extra == 'pandas-on-spark'
	pyarrow>=4.0.0; extra == 'sql'
	setuptools>=68.0.0
	six
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/databricks-sdk-0.29.0[${PYTHON_USEDEP}]
	>=dev-python/googleapis-common-protos-1.56.4[${PYTHON_USEDEP}]
	connect? ( >=dev-python/googleapis-common-protos-1.56.4[${PYTHON_USEDEP}] )
	>=dev-python/grpcio-1.59.3[${PYTHON_USEDEP}]
	connect? ( >=dev-python/grpcio-1.59.3[${PYTHON_USEDEP}] )
	>=dev-python/grpcio-status-1.59.3[${PYTHON_USEDEP}]
	connect? ( >=dev-python/grpcio-status-1.59.3[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.15[${PYTHON_USEDEP}] <dev-python/numpy-2[${PYTHON_USEDEP}]
	connect? ( >=dev-python/numpy-1.15[${PYTHON_USEDEP}] <dev-python/numpy-2[${PYTHON_USEDEP}] )
	ml? ( >=dev-python/numpy-1.15[${PYTHON_USEDEP}] <dev-python/numpy-2[${PYTHON_USEDEP}] )
	mllib? ( >=dev-python/numpy-1.15[${PYTHON_USEDEP}] <dev-python/numpy-2[${PYTHON_USEDEP}] )
	pandas-on-spark? ( >=dev-python/numpy-1.15[${PYTHON_USEDEP}] <dev-python/numpy-2[${PYTHON_USEDEP}] )
	sql? ( >=dev-python/numpy-1.15[${PYTHON_USEDEP}] <dev-python/numpy-2[${PYTHON_USEDEP}] )
	>=dev-python/packaging-23.2[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.0.5[${PYTHON_USEDEP}]
	connect? ( >=dev-python/pandas-1.0.5[${PYTHON_USEDEP}] )
	pandas-on-spark? ( >=dev-python/pandas-1.0.5[${PYTHON_USEDEP}] )
	sql? ( >=dev-python/pandas-1.0.5[${PYTHON_USEDEP}] )
	~dev-python/py4j-0.10.9.7[${PYTHON_USEDEP}]
	>=dev-python/pyarrow-4.0.0[${PYTHON_USEDEP}]
	connect? ( >=dev-python/pyarrow-4.0.0[${PYTHON_USEDEP}] )
	pandas-on-spark? ( >=dev-python/pyarrow-4.0.0[${PYTHON_USEDEP}] )
	sql? ( >=dev-python/pyarrow-4.0.0[${PYTHON_USEDEP}] )
	>=dev-python/setuptools-68.0.0[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
