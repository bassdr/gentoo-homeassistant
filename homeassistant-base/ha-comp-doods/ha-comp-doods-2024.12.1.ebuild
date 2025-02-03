EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.doods"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	=dev-python/pillow-11.0.0[${PYTHON_USEDEP}]
	=dev-python/pydoods-1.0.2[${PYTHON_USEDEP}]
"
