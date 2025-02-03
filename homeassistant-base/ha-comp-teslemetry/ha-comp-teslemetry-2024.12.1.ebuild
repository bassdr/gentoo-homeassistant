EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.teslemetry"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	=dev-python/tesla-fleet-api-0.8.5[${PYTHON_USEDEP}]
	=dev-python/teslemetry-stream-0.4.2[${PYTHON_USEDEP}]
"
