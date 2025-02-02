# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="instruments"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.50b0)"
S="${WORKDIR}/${PN}-0.50b0"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/opentelemetry-instrumentation-grpc/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	instruments? ( >=dev-python/grpcio-1.42.0[${PYTHON_USEDEP}] )
	~dev-python/opentelemetry-api-1.12[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-instrumentation-0.50_beta0[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-semantic-conventions-0.50_beta0[${PYTHON_USEDEP}]
	<dev-python/wrapt-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
