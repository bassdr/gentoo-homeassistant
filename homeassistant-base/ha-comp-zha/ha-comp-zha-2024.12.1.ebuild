EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.zha"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/universal-silabs-flasher-0.0.25[${PYTHON_USEDEP}]
	~dev-python/zha-0.0.41[${PYTHON_USEDEP}]
"
