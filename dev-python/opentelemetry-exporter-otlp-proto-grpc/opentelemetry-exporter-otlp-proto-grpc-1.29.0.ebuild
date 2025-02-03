# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/opentelemetry-exporter-otlp-proto-grpc/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/deprecated-1.2.6[${PYTHON_USEDEP}]
	>=dev-python/googleapis-common-protos-1.52[${PYTHON_USEDEP}] =dev-python/googleapis-common-protos-1*[${PYTHON_USEDEP}]
	<dev-python/grpcio-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.15[${PYTHON_USEDEP}] =dev-python/opentelemetry-api-1*[${PYTHON_USEDEP}]
	=dev-python/opentelemetry-exporter-otlp-proto-common-1.29.0[${PYTHON_USEDEP}]
	=dev-python/opentelemetry-proto-1.29.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-sdk-1.29.0[${PYTHON_USEDEP}] =dev-python/opentelemetry-sdk-1.29*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
