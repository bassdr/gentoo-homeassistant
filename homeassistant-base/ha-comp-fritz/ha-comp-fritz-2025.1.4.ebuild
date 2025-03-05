EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.fritz"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/fritzconnection-1.14.0[qr,${PYTHON_USEDEP}]
	~dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-network-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
