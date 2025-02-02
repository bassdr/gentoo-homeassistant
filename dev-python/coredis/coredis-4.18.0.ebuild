# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="recipes"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/coredis/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	recipes? ( >=dev-python/aiobotocore-2.15.2[${PYTHON_USEDEP}] )
	<dev-python/async-timeout-6[${PYTHON_USEDEP}]
	recipes? ( >=dev-python/asyncache-0.3.1[${PYTHON_USEDEP}] )
	>=dev-python/deprecated-1.2[${PYTHON_USEDEP}]
	<dev-python/packaging-25[${PYTHON_USEDEP}]
	<dev-python/pympler-2[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.3[${PYTHON_USEDEP}]
	<dev-python/wrapt-2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
