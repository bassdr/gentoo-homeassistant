EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.otbr"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/python-otbr-api-2.6.0[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-homeassistant-hardware-2025.1.4
	=homeassistant-base/ha-comp-thread-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
