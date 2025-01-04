EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.geonetnz_volcano"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/aio-geojson-geonetnz-volcano-0.9[${PYTHON_USEDEP}]
"