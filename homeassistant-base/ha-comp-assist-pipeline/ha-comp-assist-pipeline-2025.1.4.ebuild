EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.assist_pipeline"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/pymicro-vad-1.0.1[${PYTHON_USEDEP}]
	~dev-python/pyspeex-noise-1.0.2[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-conversation-2025.1.4
	=homeassistant-base/ha-comp-stt-2025.1.4
	=homeassistant-base/ha-comp-tts-2025.1.4
	=homeassistant-base/ha-comp-wake-word-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
