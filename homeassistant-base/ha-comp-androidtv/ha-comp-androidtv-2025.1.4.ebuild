EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.androidtv"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/adb-shell-0.4.4[async,${PYTHON_USEDEP}]
	~dev-python/androidtv-0.0.75[async,${PYTHON_USEDEP}]
	=homeassistant-base/ha-core-2025.1.4
"
