EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.elmax"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/elmax-api-0.0.6.4_rc0[${PYTHON_USEDEP}]
	=homeassistant-base/ha-core-2025.1.4
"
