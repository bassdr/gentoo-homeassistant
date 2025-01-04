EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.onvif"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/onvif-zeep-async-3.1.12[${PYTHON_USEDEP}]
	~dev-python/wsdiscovery-2.0.0[${PYTHON_USEDEP}]
"
