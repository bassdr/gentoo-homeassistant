EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.rainforest_eagle"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	=dev-python/aioeagle-1.1.0[${PYTHON_USEDEP}]
	=dev-python/eagle100-0.1.1[${PYTHON_USEDEP}]
"
