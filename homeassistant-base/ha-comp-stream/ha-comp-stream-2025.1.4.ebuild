EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.stream"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/av-13.1.0[${PYTHON_USEDEP}]
	~dev-python/numpy-2.2.0[${PYTHON_USEDEP}]
	~dev-python/pyturbojpeg-1.7.5[${PYTHON_USEDEP}]
	=homeassistant-base/ha-comp-http-2025.1.4
	=homeassistant-base/ha-core-2025.1.4
"
