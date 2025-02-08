# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/langchain-fireworks/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	aiohttp<4.0.0,>=3.9.1
	fireworks-ai>=0.13.0
	langchain-core<0.4.0,>=0.3.33
	openai<2.0.0,>=1.10.0
	requests<3,>=2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.9.1[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/fireworks-ai-0.13.0[${PYTHON_USEDEP}]
	>=dev-python/langchain-core-0.3.33[${PYTHON_USEDEP}] <dev-python/langchain-core-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/openai-1.10.0[${PYTHON_USEDEP}] <dev-python/openai-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2[${PYTHON_USEDEP}] <dev-python/requests-3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest

