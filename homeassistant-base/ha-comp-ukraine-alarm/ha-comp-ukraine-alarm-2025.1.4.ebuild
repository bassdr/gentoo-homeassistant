EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.ukraine_alarm"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/uasiren-0.0.1[${PYTHON_USEDEP}]
	=homeassistant-base/ha-core-2025.1.4
"
