# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/furiosa-native-device/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"


distutils_enable_tests pytest
REQUIRES_DIST="
	pytest ~=7.3 ; extra == 'test'
	pytest-asyncio ~=0.21 ; extra == 'test'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-7.3[${PYTHON_USEDEP}] =dev-python/pytest-7*[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.21[${PYTHON_USEDEP}] =dev-python/pytest-asyncio-0*[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
