EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.ondilo_ico"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/ondilo-0.5.0[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-auth-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
