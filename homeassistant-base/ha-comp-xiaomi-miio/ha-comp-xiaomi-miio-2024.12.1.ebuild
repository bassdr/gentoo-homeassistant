EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.xiaomi_miio"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/construct-2.10.68[${PYTHON_USEDEP}]
	~dev-python/micloud-0.5[${PYTHON_USEDEP}]
	~dev-python/python-miio-0.5.12[${PYTHON_USEDEP}]
"
