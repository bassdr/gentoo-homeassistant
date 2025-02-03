EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.zengge"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	=dev-python/bluepy-1.3.0[${PYTHON_USEDEP}]
	=dev-python/zengge-0.2[${PYTHON_USEDEP}]
"
