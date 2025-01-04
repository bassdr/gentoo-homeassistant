EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.ziggo_mediabox_xl"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/ziggo-mediabox-xl-1.1.0[${PYTHON_USEDEP}]
"
