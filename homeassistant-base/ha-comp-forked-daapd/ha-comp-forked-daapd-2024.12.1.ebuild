EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.forked_daapd"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/pyforked-daapd-0.1.14[${PYTHON_USEDEP}]
	~dev-python/pylibrespot-java-0.1.1[${PYTHON_USEDEP}]
"
