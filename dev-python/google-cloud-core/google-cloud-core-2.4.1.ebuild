# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="grpc"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/google-cloud-core/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	google-api-core !=2.0.*,!=2.1.*,!=2.2.*,!=2.3.0,<3.0.0dev,>=1.31.6
	google-auth <3.0dev,>=1.25.0
	grpcio <2.0dev,>=1.38.0 ; extra == 'grpc'
	grpcio-status <2.0.dev0,>=1.38.0 ; extra == 'grpc'
	importlib-metadata >1.0.0 ; python_version < '3.8'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/google-api-core-1.31.6[${PYTHON_USEDEP}] <dev-python/google-api-core-3.0.0_pre[${PYTHON_USEDEP}] !=dev-python/google-api-core-2.0*[${PYTHON_USEDEP}] !=dev-python/google-api-core-2.1*[${PYTHON_USEDEP}] !=dev-python/google-api-core-2.2*[${PYTHON_USEDEP}] !~dev-python/google-api-core-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/google-auth-1.25.0[${PYTHON_USEDEP}] <dev-python/google-auth-3.0_pre[${PYTHON_USEDEP}]
	grpc? ( >=dev-python/grpcio-1.38.0[${PYTHON_USEDEP}] <dev-python/grpcio-2.0_pre[${PYTHON_USEDEP}] )
	grpc? ( >=dev-python/grpcio-status-1.38.0[${PYTHON_USEDEP}] <dev-python/grpcio-status-2.0_pre0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
