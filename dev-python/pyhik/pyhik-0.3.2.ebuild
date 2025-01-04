# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )
PYPI_NO_NORMALIZE=1

PYPI_PN="pyHik"

inherit distutils-r1 pypi

DESCRIPTION="Provides a python api to interact with a Hikvision camera event stream and toggle motion detection."
HOMEPAGE="
  https://pypi.org/project/pyHik/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND=""

EPYTEST_XDIST=1
distutils_enable_tests pytest