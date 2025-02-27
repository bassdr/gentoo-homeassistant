# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="openvino test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/furiosa-serving/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Pillow
	furiosa-server==0.10.*
	furiosa-server[openvino]==0.10.*; extra == 'openvino'
	httpx
	mypy; extra == 'test'
	opentelemetry-api
	opentelemetry-exporter-otlp
	opentelemetry-instrumentation-fastapi
	opentelemetry-instrumentation-logging
	opentelemetry-sdk
	prometheus-client
	pytest-asyncio~=0.17.2; extra == 'test'
	pytest-cov; extra == 'test'
	pytest; extra == 'test'
	python-multipart
	ruff; extra == 'test'
	transformers; extra == 'openvino'
	types-Pillow; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	=dev-python/furiosa-server-0.10*[${PYTHON_USEDEP}]
	openvino? ( =dev-python/furiosa-server-0.10*[openvino,${PYTHON_USEDEP}] )
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/opentelemetry-api[${PYTHON_USEDEP}]
	dev-python/opentelemetry-exporter-otlp[${PYTHON_USEDEP}]
	dev-python/opentelemetry-instrumentation-fastapi[${PYTHON_USEDEP}]
	dev-python/opentelemetry-instrumentation-logging[${PYTHON_USEDEP}]
	dev-python/opentelemetry-sdk[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/prometheus-client[${PYTHON_USEDEP}]
	dev-python/python-multipart[${PYTHON_USEDEP}]
	openvino? ( dev-python/transformers[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.17.2[${PYTHON_USEDEP}] =dev-python/pytest-asyncio-0.17*[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
		dev-python/types-pillow[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
