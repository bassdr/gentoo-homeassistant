EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.zha"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/universal-silabs-flasher-0.0.25[${PYTHON_USEDEP}]
	~dev-python/zha-0.0.45[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-file-upload-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
