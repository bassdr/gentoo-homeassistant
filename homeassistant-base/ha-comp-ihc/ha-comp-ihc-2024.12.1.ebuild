EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.ihc"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
	~dev-python/ihcsdk-2.8.5[${PYTHON_USEDEP}]
"
