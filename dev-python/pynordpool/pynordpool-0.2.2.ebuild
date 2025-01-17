# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Retrieve values from API at Nord Pool."
HOMEPAGE="
  https://pypi.org/project/pynordpool/
  Bug Tracker, https://github.com/gjohansson-ST/pynordpool/issues
  Changelog, https://github.com/gjohansson-ST/pynordpool/releases
  Documentation, https://github.com/gjohansson-ST/pynordpool
  Repository, https://github.com/gjohansson-ST/pynordpool
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

EPYTEST_XDIST=1
distutils_enable_tests pytest
