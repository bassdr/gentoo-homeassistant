EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.azure_data_explorer"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	=dev-python/azure-kusto-data-4.5.1[aio,${PYTHON_USEDEP}]
	=dev-python/azure-kusto-ingest-4.5.1[${PYTHON_USEDEP}]
"
