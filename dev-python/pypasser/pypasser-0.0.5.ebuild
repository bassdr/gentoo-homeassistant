# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Bypassing reCaptcha V3 by sending HTTP requests & solving reCaptcha V2 using speech to text."
HOMEPAGE="
  https://pypi.org/project/pypasser/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/pysocks[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pydub[${PYTHON_USEDEP}]
	dev-python/speechrecognition[${PYTHON_USEDEP}]
	dev-python/selenium[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} "

EPYTEST_XDIST=1
distutils_enable_tests pytest