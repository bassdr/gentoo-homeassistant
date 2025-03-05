EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.lifx"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/aiolifx-1.1.2[${PYTHON_USEDEP}]
	~dev-python/aiolifx-effects-0.3.2[${PYTHON_USEDEP}]
	~dev-python/aiolifx-themes-0.6.0[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-network-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
