EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.frontend"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/home-assistant-frontend-20250109.2[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-api-2025.1.4
	=homeassistant-base/ha-comp-auth-2025.1.4
	=homeassistant-base/ha-comp-config-2025.1.4
	=homeassistant-base/ha-comp-device-automation-2025.1.4
	=homeassistant-base/ha-comp-diagnostics-2025.1.4
	=homeassistant-base/ha-comp-file-upload-2025.1.4
	=homeassistant-base/ha-comp-http-2025.1.4
	=homeassistant-base/ha-comp-lovelace-2025.1.4
	=homeassistant-base/ha-comp-onboarding-2025.1.4
	=homeassistant-base/ha-comp-repairs-2025.1.4
	=homeassistant-base/ha-comp-search-2025.1.4
	=homeassistant-base/ha-comp-system-log-2025.1.4
	=homeassistant-base/ha-comp-websocket-api-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
