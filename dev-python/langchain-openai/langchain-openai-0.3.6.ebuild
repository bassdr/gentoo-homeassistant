# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/langchain-openai/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	langchain-core<1.0.0,>=0.3.35
	openai<2.0.0,>=1.58.1
	tiktoken<1,>=0.7
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/langchain-core-0.3.35[${PYTHON_USEDEP}] <dev-python/langchain-core-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/openai-1.58.1[${PYTHON_USEDEP}] <dev-python/openai-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/tiktoken-0.7[${PYTHON_USEDEP}] <dev-python/tiktoken-1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
