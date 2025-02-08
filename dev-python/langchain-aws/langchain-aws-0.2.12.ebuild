# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/langchain-aws/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	boto3>=1.35.74
	langchain-core<0.4.0,>=0.3.27
	numpy<2,>=1; python_version < "3.12"
	numpy<3,>=1.26.0; python_version >= "3.12"
	pydantic<3,>=2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/boto3-1.35.74[${PYTHON_USEDEP}]
	>=dev-python/langchain-core-0.3.27[${PYTHON_USEDEP}] <dev-python/langchain-core-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}] <dev-python/numpy-3[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2[${PYTHON_USEDEP}] <dev-python/pydantic-3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest

