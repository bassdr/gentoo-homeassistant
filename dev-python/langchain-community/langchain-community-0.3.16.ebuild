# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/langchain-community/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	<dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	<dev-python/dataclasses-json-0.7[${PYTHON_USEDEP}]
	<dev-python/httpx-sse-0.5.0[${PYTHON_USEDEP}]
	<dev-python/langchain-0.4.0[${PYTHON_USEDEP}]
	<dev-python/langchain-core-0.4.0[${PYTHON_USEDEP}]
	<dev-python/langsmith-0.4[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '<dev-python/numpy-2[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '<dev-python/numpy-3[${PYTHON_USEDEP}]' python3_13{,t})
	<dev-python/pydantic-settings-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3[${PYTHON_USEDEP}]
	<dev-python/requests-3[${PYTHON_USEDEP}]
	<dev-python/sqlalchemy-3[${PYTHON_USEDEP}]
	!=dev-python/tenacity-8.4.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
