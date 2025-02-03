EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.samsungtv"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	=dev-python/async-upnp-client-0.41.0[${PYTHON_USEDEP}]
	=dev-python/getmac-0.9.4[${PYTHON_USEDEP}]
	=dev-python/samsungctl-0.7.1[websocket,${PYTHON_USEDEP}]
	=dev-python/samsungtvws-2.7.2[async,encrypted,${PYTHON_USEDEP}]
	=dev-python/wakeonlan-2.1.0[${PYTHON_USEDEP}]
"
