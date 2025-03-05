EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.rtsp_to_webrtc"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/rtsp-to-webrtc-0.5.1[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-camera-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
