EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.homekit"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/base36-0.1.1[${PYTHON_USEDEP}]
	~dev-python/fnv-hash-fast-1.0.2[${PYTHON_USEDEP}]
	~dev-python/hap-python-4.9.2[${PYTHON_USEDEP}]
	~dev-python/pyqrcode-1.2.1[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-ffmpeg-2025.1.4
	=homeassistant-base/ha-comp-http-2025.1.4
	=homeassistant-base/ha-comp-network-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
