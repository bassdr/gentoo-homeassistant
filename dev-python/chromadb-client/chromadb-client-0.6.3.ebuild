# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/chromadb-client/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
	<dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-exporter-otlp-proto-grpc-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-sdk-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.12[${PYTHON_USEDEP}]
	>=dev-python/overrides-7.3.1[${PYTHON_USEDEP}]
	>=dev-python/posthog-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.2.3[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.5.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
