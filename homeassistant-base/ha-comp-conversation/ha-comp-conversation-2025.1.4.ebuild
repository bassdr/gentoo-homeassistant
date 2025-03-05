EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.conversation"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/hassil-2.1.0[${PYTHON_USEDEP}]
	~dev-python/home-assistant-intents-2025.1.1[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-http-2025.1.4
	=homeassistant-base/ha-comp-intent-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
