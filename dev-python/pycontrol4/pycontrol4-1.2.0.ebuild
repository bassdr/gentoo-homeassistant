# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )
PYPI_NO_NORMALIZE=1

PYPI_PN="pyControl4"

inherit distutils-r1 pypi

DESCRIPTION="Python 3 asyncio package for interacting with Control4 systems"
HOMEPAGE="
  https://pypi.org/project/pyControl4/
"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/python-socketio-v4[${PYTHON_USEDEP}]
	dev-python/websocket-client[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} "

EPYTEST_XDIST=1
distutils_enable_tests pytest
