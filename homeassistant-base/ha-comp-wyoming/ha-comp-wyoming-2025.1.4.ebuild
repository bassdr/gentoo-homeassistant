EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.wyoming"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/wyoming-1.5.4[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-assist-pipeline-2025.1.4
	=homeassistant-base/ha-comp-assist-satellite-2025.1.4
	=homeassistant-base/ha-comp-conversation-2025.1.4
	=homeassistant-base/ha-comp-intent-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
