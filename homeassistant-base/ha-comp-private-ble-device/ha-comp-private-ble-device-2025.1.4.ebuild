EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.private_ble_device"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/bluetooth-data-tools-1.20.0[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-bluetooth-adapters-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
