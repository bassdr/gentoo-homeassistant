EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.knx"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/knx-frontend-2025.1.18.164225[${PYTHON_USEDEP}]
	~dev-python/xknx-3.4.0[${PYTHON_USEDEP}]
	~dev-python/xknxproject-3.8.1[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-file-upload-2025.1.4
	=homeassistant-base/ha-comp-http-2025.1.4
	=homeassistant-base/ha-comp-websocket-api-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
