# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION="Python client for Apple WeatherKit API"
HOMEPAGE="
  https://pypi.org/project/apple-weatherkit/
  Repository, https://github.com/tjhorner/python-weatherkit
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	aiohttp-retry<3.0.0,>=2.8.3
	aiohttp<4.0.0,>=3.8.5
	pyjwt[crypto]==2.*
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8.5[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-retry-2.8.3[${PYTHON_USEDEP}] <dev-python/aiohttp-retry-3.0.0[${PYTHON_USEDEP}]
	=dev-python/pyjwt-2*[crypto,${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

EPYTEST_XDIST=1
distutils_enable_tests pytest
