# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/langchain-elasticsearch/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	elasticsearch[vectorstore-mmr]<9.0.0,>=8.13.1
	langchain-core<0.4.0,>=0.3.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/elasticsearch-8.13.1[vectorstore-mmr,${PYTHON_USEDEP}] <dev-python/elasticsearch-9.0.0[vectorstore-mmr,${PYTHON_USEDEP}]
	>=dev-python/langchain-core-0.3.0[${PYTHON_USEDEP}] <dev-python/langchain-core-0.4.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
