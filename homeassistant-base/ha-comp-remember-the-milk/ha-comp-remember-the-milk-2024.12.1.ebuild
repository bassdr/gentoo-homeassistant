EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.remember_the_milk"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/httplib2-0.20.4[${PYTHON_USEDEP}]
	~dev-python/rtmapi-0.7.2[${PYTHON_USEDEP}]
"
