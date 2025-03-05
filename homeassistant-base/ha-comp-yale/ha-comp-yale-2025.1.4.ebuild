EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.yale"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/yalexs-8.10.0[${PYTHON_USEDEP}]
	~dev-python/yalexs-ble-2.5.6[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-application-credentials-2025.1.4
	=homeassistant-base/ha-comp-cloud-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
