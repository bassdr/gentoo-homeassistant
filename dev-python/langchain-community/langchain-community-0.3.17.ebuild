# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/langchain-community/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	PyYAML>=5.3
	SQLAlchemy<3,>=1.4
	aiohttp<4.0.0,>=3.8.3
	dataclasses-json<0.7,>=0.5.7
	httpx-sse<1.0.0,>=0.4.0
	langchain-core<1.0.0,>=0.3.34
	langchain<1.0.0,>=0.3.18
	langsmith<0.4,>=0.1.125
	numpy<2,>=1.26.4; python_version < '3.12'
	numpy<3,>=1.26.2; python_version >= '3.12'
	pydantic-settings<3.0.0,>=2.4.0
	requests<3,>=2
	tenacity!=8.4.0,<10,>=8.1.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8.3[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/dataclasses-json-0.5.7[${PYTHON_USEDEP}] <dev-python/dataclasses-json-0.7[${PYTHON_USEDEP}]
	>=dev-python/httpx-sse-0.4.0[${PYTHON_USEDEP}] <dev-python/httpx-sse-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/langchain-0.3.18[${PYTHON_USEDEP}] <dev-python/langchain-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/langchain-core-0.3.34[${PYTHON_USEDEP}] <dev-python/langchain-core-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/langsmith-0.1.125[${PYTHON_USEDEP}] <dev-python/langsmith-0.4[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.26.2[${PYTHON_USEDEP}] <dev-python/numpy-3[${PYTHON_USEDEP}]
	>=dev-python/pydantic-settings-2.4.0[${PYTHON_USEDEP}] <dev-python/pydantic-settings-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3[${PYTHON_USEDEP}]
	>=dev-python/requests-2[${PYTHON_USEDEP}] <dev-python/requests-3[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.4[${PYTHON_USEDEP}] <dev-python/sqlalchemy-3[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.1.0[${PYTHON_USEDEP}] <dev-python/tenacity-10[${PYTHON_USEDEP}] !~dev-python/tenacity-8.4.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
