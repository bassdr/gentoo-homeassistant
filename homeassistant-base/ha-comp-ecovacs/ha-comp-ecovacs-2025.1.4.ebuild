EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.ecovacs"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/deebot-client-11.0.0[${PYTHON_USEDEP}]
	~dev-python/py-sucks-0.9.10[${PYTHON_USEDEP}]
"
