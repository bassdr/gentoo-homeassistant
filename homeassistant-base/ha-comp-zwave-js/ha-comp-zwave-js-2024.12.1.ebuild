EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.zwave_js"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	=dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	=dev-python/zwave-js-server-python-0.59.1[${PYTHON_USEDEP}]
"
