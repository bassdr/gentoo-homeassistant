EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.xmpp"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	=dev-python/emoji-2.8.0[${PYTHON_USEDEP}]
	=dev-python/slixmpp-1.8.5[${PYTHON_USEDEP}]
"
