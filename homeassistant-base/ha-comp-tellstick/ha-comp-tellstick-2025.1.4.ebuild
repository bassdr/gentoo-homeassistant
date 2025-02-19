EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.tellstick"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/tellcore-net-0.4[${PYTHON_USEDEP}]
	~dev-python/tellcore-py-1.1.2[${PYTHON_USEDEP}]
"
