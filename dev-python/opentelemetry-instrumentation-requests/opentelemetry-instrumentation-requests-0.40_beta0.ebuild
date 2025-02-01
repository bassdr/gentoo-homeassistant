# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="instruments"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

SRC_URI="$(pypi_sdist_url --no-normalize "opentelemetry-instrumentation-requests" "0.40b0")"
S="${WORKDIR}/opentelemetry-instrumentation-requests-0.40b0"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/opentelemetry-instrumentation-requests/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	~dev-python/opentelemetry-api-1.12[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-instrumentation-0.40_beta0[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-semantic-conventions-0.40_beta0[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-util-http-0.40_beta0[${PYTHON_USEDEP}]
	instruments? ( ~dev-python/requests-2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/httpretty-1.0[${PYTHON_USEDEP}]
	dev-python/opentelemetry-instrumentation-requests[instruments,${PYTHON_USEDEP}]
	~dev-python/opentelemetry-test-utils-0.40_beta0[${PYTHON_USEDEP}]
)"
