EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.zwave_me"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/url-normalize-1.4.3[${PYTHON_USEDEP}]
	~dev-python/zwave-me-ws-0.4.3[${PYTHON_USEDEP}]
"