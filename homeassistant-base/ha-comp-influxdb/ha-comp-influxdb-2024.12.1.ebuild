EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.influxdb"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/influxdb-5.3.1[${PYTHON_USEDEP}]
	~dev-python/influxdb-client-1.24.0[${PYTHON_USEDEP}]
"