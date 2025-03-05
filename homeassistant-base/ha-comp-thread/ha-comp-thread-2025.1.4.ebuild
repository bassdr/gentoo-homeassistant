EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.thread"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/pyroute2-0.7.5[${PYTHON_USEDEP}]
	~dev-python/python-otbr-api-2.6.0[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-zeroconf-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
