# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/eheimdigital/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	aiohttp
	yarl
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest

