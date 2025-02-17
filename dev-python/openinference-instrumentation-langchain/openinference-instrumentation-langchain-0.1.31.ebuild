# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="instruments type-check"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/openinference-instrumentation-langchain/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	langchain-community==0.3.15; extra == 'test'
	langchain-core==0.2.43; extra == 'type-check'
	langchain-core==0.3.31; extra == 'test'
	langchain-core>=0.2.43; extra == 'instruments'
	langchain-google-vertexai==2.0.12; extra == 'test'
	langchain-openai==0.2.14; extra == 'test'
	langchain==0.3.15; extra == 'test'
	langsmith; extra == 'test'
	openinference-instrumentation>=0.1.17
	openinference-semantic-conventions>=0.1.9
	opentelemetry-api
	opentelemetry-instrumentation
	opentelemetry-sdk; extra == 'test'
	opentelemetry-semantic-conventions
	portpicker; extra == 'test'
	pytest-recording; extra == 'test'
	respx; extra == 'test'
	starlette; extra == 'test'
	uvicorn; extra == 'test'
	wrapt
"
GENERATED_RDEPEND="${RDEPEND}
	instruments? ( >=dev-python/langchain-core-0.2.43[${PYTHON_USEDEP}] )
	type-check? ( ~dev-python/langchain-core-0.2.43[${PYTHON_USEDEP}] )
	>=dev-python/openinference-instrumentation-0.1.17[${PYTHON_USEDEP}]
	>=dev-python/openinference-semantic-conventions-0.1.9[${PYTHON_USEDEP}]
	dev-python/opentelemetry-api[${PYTHON_USEDEP}]
	dev-python/opentelemetry-instrumentation[${PYTHON_USEDEP}]
	dev-python/opentelemetry-semantic-conventions[${PYTHON_USEDEP}]
	dev-python/wrapt[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/langchain-0.3.15[${PYTHON_USEDEP}]
		~dev-python/langchain-community-0.3.15[${PYTHON_USEDEP}]
		~dev-python/langchain-core-0.3.31[${PYTHON_USEDEP}]
		~dev-python/langchain-google-vertexai-2.0.12[${PYTHON_USEDEP}]
		~dev-python/langchain-openai-0.2.14[${PYTHON_USEDEP}]
		dev-python/langsmith[${PYTHON_USEDEP}]
		dev-python/opentelemetry-sdk[${PYTHON_USEDEP}]
		dev-python/portpicker[${PYTHON_USEDEP}]
		dev-python/pytest-recording[${PYTHON_USEDEP}]
		dev-python/respx[${PYTHON_USEDEP}]
		dev-python/starlette[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
