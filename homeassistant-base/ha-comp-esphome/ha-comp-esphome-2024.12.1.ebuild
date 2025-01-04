EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.esphome"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/aioesphomeapi-28.0.0[${PYTHON_USEDEP}]
	~dev-python/bleak-esphome-1.1.0[${PYTHON_USEDEP}]
	~dev-python/esphome-dashboard-api-1.2.3[${PYTHON_USEDEP}]
"
