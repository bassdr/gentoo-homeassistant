EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.system_bridge"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/systembridgeconnector-4.1.5[${PYTHON_USEDEP}]
	~dev-python/systembridgemodels-4.2.4[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-media-source-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
