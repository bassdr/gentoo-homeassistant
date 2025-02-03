EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.here_travel_time"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	=dev-python/here-routing-1.0.1[${PYTHON_USEDEP}]
	=dev-python/here-transit-1.2.1[${PYTHON_USEDEP}]
"
