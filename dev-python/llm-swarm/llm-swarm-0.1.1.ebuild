# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/llm-swarm/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8.6[${PYTHON_USEDEP}]
	>=dev-python/asyncio-3.4.3[${PYTHON_USEDEP}]
	>=dev-python/datasets-2.16.1[${PYTHON_USEDEP}]
	>=dev-python/hf-transfer-0.1.4[${PYTHON_USEDEP}]
	>=dev-python/huggingface-hub-0.20.3[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.2[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.1.2[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.66.1[${PYTHON_USEDEP}]
	>=dev-python/transformers-4.36.2[${PYTHON_USEDEP}]
	>=dev-python/tyro-0.5.12[${PYTHON_USEDEP}]
	>=dev-python/wonderwords-2.2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
