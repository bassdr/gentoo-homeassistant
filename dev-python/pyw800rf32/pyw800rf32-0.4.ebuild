# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )
PYPI_NO_NORMALIZE=1

PYPI_PN="pyW800rf32"

inherit distutils-r1 pypi

DESCRIPTION="A library to communicate with the W800rf32 family of devices"
HOMEPAGE="
  https://pypi.org/project/pyW800rf32/
  Homepage, https://github.com/horga83/pyW800rf32
  Bug Tracker, https://github.com/horga83/pyW800rf32/issues
"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/pyserial[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} "

EPYTEST_XDIST=1
distutils_enable_tests pytest
