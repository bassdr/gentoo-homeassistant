# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="instruments test type-check"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/openinference-instrumentation-langchain/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	test? ( ~dev-python/langchain-0.1.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/langchain-community-0.0.10[${PYTHON_USEDEP}] )
	instruments? ( >=dev-python/langchain-core-0.1.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/langchain-core-0.1.8[${PYTHON_USEDEP}] )
	type-check? ( ~dev-python/langchain-core-0.1.5[${PYTHON_USEDEP}] )
	test? ( ~dev-python/langchain-openai-0.0.2[${PYTHON_USEDEP}] )
	test? ( dev-python/langsmith[${PYTHON_USEDEP}] )
	>=dev-python/openinference-instrumentation-0.1.17[${PYTHON_USEDEP}]
	>=dev-python/openinference-semantic-conventions-0.1.9[${PYTHON_USEDEP}]
	dev-python/opentelemetry-api[${PYTHON_USEDEP}]
	dev-python/opentelemetry-instrumentation[${PYTHON_USEDEP}]
	test? ( dev-python/opentelemetry-sdk[${PYTHON_USEDEP}] )
	dev-python/opentelemetry-semantic-conventions[${PYTHON_USEDEP}]
	test? ( dev-python/portpicker[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-recording[${PYTHON_USEDEP}] )
	test? ( dev-python/respx[${PYTHON_USEDEP}] )
	test? ( dev-python/starlette[${PYTHON_USEDEP}] )
	test? ( dev-python/uvicorn[${PYTHON_USEDEP}] )
	dev-python/wrapt[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest