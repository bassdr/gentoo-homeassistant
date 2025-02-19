EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.roborock"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/python-roborock-2.8.4[${PYTHON_USEDEP}]
	~dev-python/vacuum-map-parser-roborock-0.1.2[${PYTHON_USEDEP}]
"
