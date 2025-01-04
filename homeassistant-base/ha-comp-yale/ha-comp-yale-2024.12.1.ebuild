EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.yale"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/yalexs-8.10.0[${PYTHON_USEDEP}]
	~dev-python/yalexs-ble-2.5.1[${PYTHON_USEDEP}]
"
