EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.plex"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/plexapi-4.15.16[${PYTHON_USEDEP}]
	~dev-python/plexauth-0.0.6[${PYTHON_USEDEP}]
	~dev-python/plexwebsocket-0.0.14[${PYTHON_USEDEP}]
"