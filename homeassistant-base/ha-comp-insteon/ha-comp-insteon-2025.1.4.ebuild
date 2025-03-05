EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.insteon"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/insteon-frontend-home-assistant-0.5.0[${PYTHON_USEDEP}]
	~dev-python/pyinsteon-1.6.3[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-http-2025.1.4
	=homeassistant-base/ha-comp-websocket-api-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
