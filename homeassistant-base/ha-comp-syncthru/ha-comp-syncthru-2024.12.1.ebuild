EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.syncthru"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/pysyncthru-0.7.10[${PYTHON_USEDEP}]
	~dev-python/url-normalize-1.4.3[${PYTHON_USEDEP}]
"
