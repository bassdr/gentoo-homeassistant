# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/langchain-chroma/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	chromadb!=0.5.4,!=0.5.5,<0.6.0,>=0.4.0
	fastapi<1,>=0.95.2
	langchain-core<0.3,>=0.1.40; python_version < '3.9'
	langchain-core<0.4,>=0.1.40; python_version >= '3.9'
	numpy<2,>=1; python_version < '3.12'
	numpy<2.0.0,>=1.26.0; python_version >= '3.12'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/chromadb-0.4.0[${PYTHON_USEDEP}] <dev-python/chromadb-0.6.0[${PYTHON_USEDEP}] !~dev-python/chromadb-0.5.4[${PYTHON_USEDEP}] !~dev-python/chromadb-0.5.5[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.95.2[${PYTHON_USEDEP}] <dev-python/fastapi-1[${PYTHON_USEDEP}]
	>=dev-python/langchain-core-0.1.40[${PYTHON_USEDEP}] <dev-python/langchain-core-0.4[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}] <dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
