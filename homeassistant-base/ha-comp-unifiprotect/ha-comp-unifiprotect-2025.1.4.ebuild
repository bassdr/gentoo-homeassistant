EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.unifiprotect"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/uiprotect-7.4.1[${PYTHON_USEDEP}]
	~dev-python/unifi-discovery-1.2.0[${PYTHON_USEDEP}]
"
