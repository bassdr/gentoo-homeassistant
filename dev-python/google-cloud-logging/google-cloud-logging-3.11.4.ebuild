# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/google-cloud-logging/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	!=dev-python/google-api-core-2.0*[grpc,${PYTHON_USEDEP}]
	!=dev-python/google-auth-2.24.0[${PYTHON_USEDEP}]
	<dev-python/google-cloud-appengine-logging-2.0.0dev[${PYTHON_USEDEP}]
	<dev-python/google-cloud-audit-log-1.0.0dev[${PYTHON_USEDEP}]
	<dev-python/google-cloud-core-3.0.0dev[${PYTHON_USEDEP}]
	<dev-python/grpc-google-iam-v1-1.0.0dev[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.9.0[${PYTHON_USEDEP}]
	<dev-python/proto-plus-2.0.0dev[${PYTHON_USEDEP}]
	<dev-python/proto-plus-2.0.0dev[${PYTHON_USEDEP}]
	!=dev-python/protobuf-4.21.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
