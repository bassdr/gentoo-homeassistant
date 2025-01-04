EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.tractive"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/aiotractive-0.6.0[${PYTHON_USEDEP}]
"