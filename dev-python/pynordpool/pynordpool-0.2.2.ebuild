# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )
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

REQUIRES_DIST="
	aiohttp>=3.9.2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.9.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

EPYTEST_XDIST=1
distutils_enable_tests pytest
