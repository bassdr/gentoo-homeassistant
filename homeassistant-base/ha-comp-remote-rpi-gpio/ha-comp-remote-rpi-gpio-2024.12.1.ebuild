EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.remote_rpi_gpio"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	=dev-python/gpiozero-1.6.2[${PYTHON_USEDEP}]
	=dev-python/pigpio-1.78[${PYTHON_USEDEP}]
"
