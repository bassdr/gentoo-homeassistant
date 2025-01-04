EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.bluetooth_tracker"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/bt-proximity-0.2.1[${PYTHON_USEDEP}]
	~dev-python/pybluez-0.22[${PYTHON_USEDEP}]
"
