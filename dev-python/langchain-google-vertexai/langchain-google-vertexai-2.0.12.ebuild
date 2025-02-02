# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="anthropic mistral"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/langchain-google-vertexai/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	anthropic? ( <dev-python/anthropic-1[vertexai,${PYTHON_USEDEP}] )
	<dev-python/google-cloud-aiplatform-2.0.0[${PYTHON_USEDEP}]
	<dev-python/google-cloud-storage-3.0.0[${PYTHON_USEDEP}]
	<dev-python/httpx-0.29.0[${PYTHON_USEDEP}]
	<dev-python/httpx-sse-0.5.0[${PYTHON_USEDEP}]
	<dev-python/langchain-core-0.4[${PYTHON_USEDEP}]
	mistral? ( <dev-python/langchain-mistralai-1[${PYTHON_USEDEP}] )
	<dev-python/pydantic-3.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
