# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1

PYPI_PN="apple_weatherkit"
inherit distutils-r1 pypi

DESCRIPTION="Python client for Apple WeatherKit API"
HOMEPAGE="
  https://pypi.org/project/apple_weatherkit/
  Repository, https://github.com/tjhorner/python-weatherkit
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	<dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	<dev-python/aiohttp-retry-3.0.0[${PYTHON_USEDEP}]
	dev-python/aiohttp-retry[${PYTHON_USEDEP}]
	dev-python/pyjwt[${PYTHON_USEDEP}]
	~dev-python/pyjwt-2*[crypto,${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

EPYTEST_XDIST=1
distutils_enable_tests pytest
