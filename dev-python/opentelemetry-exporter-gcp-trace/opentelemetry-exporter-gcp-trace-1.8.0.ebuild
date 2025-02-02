# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/opentelemetry-exporter-gcp-trace/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	~dev-python/google-cloud-trace-1.1[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-api-1.0[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-resourcedetector-gcp-1[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-sdk-1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
