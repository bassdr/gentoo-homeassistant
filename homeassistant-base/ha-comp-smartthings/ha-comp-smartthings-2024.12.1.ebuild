EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.smartthings"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/pysmartapp-0.3.5[${PYTHON_USEDEP}]
	~dev-python/pysmartthings-0.7.8[${PYTHON_USEDEP}]
"
