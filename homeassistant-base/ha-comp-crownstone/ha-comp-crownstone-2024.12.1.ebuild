EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.crownstone"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	=dev-python/crownstone-cloud-1.4.11[${PYTHON_USEDEP}]
	=dev-python/crownstone-sse-2.0.5[${PYTHON_USEDEP}]
	=dev-python/crownstone-uart-2.1.0[${PYTHON_USEDEP}]
	=dev-python/pyserial-3.5[${PYTHON_USEDEP}]
"
