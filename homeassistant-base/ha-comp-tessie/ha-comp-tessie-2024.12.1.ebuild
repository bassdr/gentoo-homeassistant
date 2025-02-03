EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.tessie"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	=dev-python/tesla-fleet-api-0.8.5[${PYTHON_USEDEP}]
	=dev-python/tessie-api-0.1.1[${PYTHON_USEDEP}]
"
