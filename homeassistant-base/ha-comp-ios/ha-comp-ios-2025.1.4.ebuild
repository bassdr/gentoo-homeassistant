EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.ios"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	=homeassistant-base/ha-comp-device-tracker-2025.1.4
	=homeassistant-base/ha-comp-http-2025.1.4
	=homeassistant-base/ha-comp-zeroconf-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
