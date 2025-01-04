EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.sonos"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/soco-0.30.6[${PYTHON_USEDEP}]
	~dev-python/sonos-websocket-0.1.3[${PYTHON_USEDEP}]
"
