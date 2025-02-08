# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/langchain-anthropic/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	anthropic<1,>=0.45.0
	langchain-core<1.0.0,>=0.3.34
	pydantic<3.0.0,>=2.7.4
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/anthropic-0.45.0[${PYTHON_USEDEP}] <dev-python/anthropic-1[${PYTHON_USEDEP}]
	>=dev-python/langchain-core-0.3.34[${PYTHON_USEDEP}] <dev-python/langchain-core-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.7.4[${PYTHON_USEDEP}] <dev-python/pydantic-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
