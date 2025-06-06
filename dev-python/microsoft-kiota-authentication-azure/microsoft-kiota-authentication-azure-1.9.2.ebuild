# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/microsoft-kiota-authentication-azure/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	aiohttp>=3.8.0
	azure-core>=1.21.1
	microsoft-kiota-abstractions<1.10.0,>=1.9.2
	opentelemetry-api>=1.27.0
	opentelemetry-sdk>=1.27.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/azure-core-1.21.1[${PYTHON_USEDEP}]
	>=dev-python/microsoft-kiota-abstractions-1.9.2[${PYTHON_USEDEP}] <dev-python/microsoft-kiota-abstractions-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.27.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-sdk-1.27.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
