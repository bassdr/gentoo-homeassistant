EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.bluetooth"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/bleak-0.22.3[${PYTHON_USEDEP}]
	~dev-python/bleak-retry-connector-3.6.0[${PYTHON_USEDEP}]
	~dev-python/bluetooth-adapters-0.20.2[${PYTHON_USEDEP}]
	~dev-python/bluetooth-auto-recovery-1.4.2[${PYTHON_USEDEP}]
	~dev-python/bluetooth-data-tools-1.20.0[${PYTHON_USEDEP}]
	~dev-python/dbus-fast-2.24.3[${PYTHON_USEDEP}]
	~dev-python/habluetooth-3.6.0[${PYTHON_USEDEP}]
"
