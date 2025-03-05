EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.default_config"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	=homeassistant-base/ha-comp-assist-pipeline-2025.1.4
	=homeassistant-base/ha-comp-bluetooth-2025.1.4
	=homeassistant-base/ha-comp-cloud-2025.1.4
	=homeassistant-base/ha-comp-conversation-2025.1.4
	=homeassistant-base/ha-comp-dhcp-2025.1.4
	=homeassistant-base/ha-comp-energy-2025.1.4
	=homeassistant-base/ha-comp-go2rtc-2025.1.4
	=homeassistant-base/ha-comp-history-2025.1.4
	=homeassistant-base/ha-comp-homeassistant-alerts-2025.1.4
	=homeassistant-base/ha-comp-logbook-2025.1.4
	=homeassistant-base/ha-comp-media-source-2025.1.4
	=homeassistant-base/ha-comp-mobile-app-2025.1.4
	=homeassistant-base/ha-comp-my-2025.1.4
	=homeassistant-base/ha-comp-ssdp-2025.1.4
	=homeassistant-base/ha-comp-stream-2025.1.4
	=homeassistant-base/ha-comp-sun-2025.1.4
	=homeassistant-base/ha-comp-usb-2025.1.4
	=homeassistant-base/ha-comp-webhook-2025.1.4
	=homeassistant-base/ha-comp-zeroconf-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
