# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Concurrency agnostic serialio API"
HOMEPAGE="
  https://pypi.org/project/serialio/
"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/sockio[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

EPYTEST_XDIST=1
distutils_enable_tests pytest
