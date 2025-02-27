EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.ld2410_ble"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/bluetooth-data-tools-1.20.0[${PYTHON_USEDEP}]
	~dev-python/ld2410-ble-0.1.1[${PYTHON_USEDEP}]
"
