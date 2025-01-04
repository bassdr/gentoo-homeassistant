# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )
PYPI_NO_NORMALIZE=1

PYPI_PN="PyRMVtransport"

inherit distutils-r1 pypi

DESCRIPTION="Python library to make use of transport information from opendata.rmv.de."
HOMEPAGE="
  https://pypi.org/project/PyRMVtransport/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} "

EPYTEST_XDIST=1
distutils_enable_tests pytest