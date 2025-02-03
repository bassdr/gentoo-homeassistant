EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.google"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	=dev-python/gcal-sync-6.2.0[${PYTHON_USEDEP}]
	=dev-python/ical-8.2.0[${PYTHON_USEDEP}]
	=dev-python/oauth2client-4.1.3[${PYTHON_USEDEP}]
"
