EAPI=8

PYTHON_COMPAT=( python3_12 )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.geo_json_events"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/aio-geojson-generic-client-0.5[${PYTHON_USEDEP}]
	=homeassistant-base/ha-core-2025.1.4
"
