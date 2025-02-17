# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="tracing"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sqlalchemy-spanner/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	alembic
	google-cloud-spanner>=3.12.0
	opentelemetry-api>=1.1.0; extra == 'tracing'
	opentelemetry-instrumentation>=0.20b0; extra == 'tracing'
	opentelemetry-sdk>=1.1.0; extra == 'tracing'
	sqlalchemy>=1.1.13
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/alembic[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-spanner-3.12.0[${PYTHON_USEDEP}]
	tracing? ( >=dev-python/opentelemetry-api-1.1.0[${PYTHON_USEDEP}] )
	tracing? ( >=dev-python/opentelemetry-instrumentation-0.20_beta0[${PYTHON_USEDEP}] )
	tracing? ( >=dev-python/opentelemetry-sdk-1.1.0[${PYTHON_USEDEP}] )
	>=dev-python/sqlalchemy-1.1.13[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
