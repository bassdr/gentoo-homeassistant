# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )
PYPI_NO_NORMALIZE=1

PYPI_PN="pysuezV2"

inherit distutils-r1 pypi

DESCRIPTION="Get your water consumption data from your Suez account (www.toutsurmoneau.fr or www.eau-olivet.fr)"
HOMEPAGE="
  https://pypi.org/project/pysuezV2/
  Homepage, https://github.com/jb101010-2/pySuez
  Issues, https://github.com/jb101010-2/pySuez/issues
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} "

EPYTEST_XDIST=1
distutils_enable_tests pytest
