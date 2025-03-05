EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.imgw_pib"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/imgw-pib-1.0.7[${PYTHON_USEDEP}]
	=homeassistant-base/ha-core-2025.1.4
"
