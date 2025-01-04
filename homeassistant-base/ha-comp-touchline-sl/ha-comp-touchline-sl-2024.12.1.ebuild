EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.touchline_sl"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/pytouchlinesl-0.3.0[${PYTHON_USEDEP}]
"
