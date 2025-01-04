EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.iron_os"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/aiogithubapi-24.6.0[${PYTHON_USEDEP}]
	~dev-python/pynecil-0.2.1[${PYTHON_USEDEP}]
"
