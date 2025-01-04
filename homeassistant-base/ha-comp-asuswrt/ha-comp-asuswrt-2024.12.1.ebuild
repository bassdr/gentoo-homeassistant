EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.asuswrt"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/aioasuswrt-1.4.0[${PYTHON_USEDEP}]
	~dev-python/pyasuswrt-0.1.21[${PYTHON_USEDEP}]
"
