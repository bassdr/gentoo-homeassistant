EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.nmap_tracker"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/aiooui-0.1.7[${PYTHON_USEDEP}]
	~dev-python/getmac-0.9.4[${PYTHON_USEDEP}]
	~dev-python/netmap-0.7.0.2[${PYTHON_USEDEP}]
"
