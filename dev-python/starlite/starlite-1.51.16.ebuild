# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="brotli cli cryptography jinja jwt memcached opentelemetry picologging redis structlog"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/starlite/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	memcached? ( dev-python/aiomcache[${PYTHON_USEDEP}] )
	<dev-python/anyio-4[${PYTHON_USEDEP}]
	brotli? ( dev-python/brotli[${PYTHON_USEDEP}] )
	cli? ( dev-python/click[${PYTHON_USEDEP}] )
	cryptography? ( dev-python/cryptography[${PYTHON_USEDEP}] )
	dev-python/fast-query-parsers[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.22[${PYTHON_USEDEP}]
	jinja? ( >=dev-python/jinja2-3.1.2[${PYTHON_USEDEP}] )
	cli? ( dev-python/jsbeautifier[${PYTHON_USEDEP}] )
	>=dev-python/mako-1.2.4[${PYTHON_USEDEP}]
	>=dev-python/msgspec-0.11.0[${PYTHON_USEDEP}]
	>=dev-python/multidict-6.0.2[${PYTHON_USEDEP}]
	opentelemetry? ( dev-python/opentelemetry-instrumentation-asgi[${PYTHON_USEDEP}] )
	picologging? ( dev-python/picologging[${PYTHON_USEDEP}] )
	<dev-python/pydantic-2[${PYTHON_USEDEP}]
	dev-python/pydantic-factories[${PYTHON_USEDEP}]
	>=dev-python/pydantic-openapi-schema-1.5.0[${PYTHON_USEDEP}]
	jwt? ( dev-python/python-jose[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	redis? ( dev-python/redis[hiredis,${PYTHON_USEDEP}] )
	cli? ( >=dev-python/rich-13.0.0[${PYTHON_USEDEP}] )
	structlog? ( dev-python/structlog[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
