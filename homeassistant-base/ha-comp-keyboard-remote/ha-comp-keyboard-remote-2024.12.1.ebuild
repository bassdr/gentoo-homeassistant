EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.keyboard_remote"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/asyncinotify-4.0.2[${PYTHON_USEDEP}]
	~dev-python/evdev-1.6.1[${PYTHON_USEDEP}]
"
