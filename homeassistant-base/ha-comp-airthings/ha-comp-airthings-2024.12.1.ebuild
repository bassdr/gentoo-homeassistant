EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.airthings"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/airthings-cloud-0.2.0[${PYTHON_USEDEP}]
"
