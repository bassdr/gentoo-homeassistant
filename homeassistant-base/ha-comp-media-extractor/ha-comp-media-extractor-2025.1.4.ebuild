EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.media_extractor"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	=homeassistant-base/ha-comp-media-player-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
	~net-misc/yt-dlp-2025.01.15[default,${PYTHON_USEDEP}]
"
