# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="Manage Xiaomi BLE devices"
HOMEPAGE="
  https://pypi.org/project/xiaomi-ble/
  Bug Tracker, https://github.com/bluetooth-devices/xiaomi-ble/issues
  Changelog, https://github.com/bluetooth-devices/xiaomi-ble/blob/main/CHANGELOG.md
  Documentation, https://xiaomi-ble.readthedocs.io
  Repository, https://github.com/bluetooth-devices/xiaomi-ble
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.md"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/aiohttp-3.10.0[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.19.5[${PYTHON_USEDEP}]
	dev-python/bleak[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-2.13.0[${PYTHON_USEDEP}]
	dev-python/bleak-retry-connector[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-0.3.1[${PYTHON_USEDEP}]
	dev-python/bluetooth-data-tools[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.6.0[${PYTHON_USEDEP}]
	dev-python/bluetooth-sensor-state-data[${PYTHON_USEDEP}]
	>=dev-python/cryptography-40.0.0[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	>=dev-python/home-assistant-bluetooth-1.9.2[${PYTHON_USEDEP}]
	dev-python/home-assistant-bluetooth[${PYTHON_USEDEP}]
	docs? ( <dev-python/myst-parser-0.19[${PYTHON_USEDEP}] )
	>=dev-python/orjson-3.9.0[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
	>=dev-python/pycryptodomex-3.19.1[${PYTHON_USEDEP}]
	dev-python/pycryptodomex[${PYTHON_USEDEP}]
	>=dev-python/sensor-state-data-2.17.1[${PYTHON_USEDEP}]
	dev-python/sensor-state-data[${PYTHON_USEDEP}]
	docs? ( <dev-python/sphinx-6.0[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-rtd-theme-2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/home-assistant-bluetooth-1.9.2[${PYTHON_USEDEP}]
	>=dev-python/sensor-state-data-2.17.1[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-2.13.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-0.3.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.19.5[${PYTHON_USEDEP}]
	>=dev-python/cryptography-40.0.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodomex-3.19.1[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.10.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.0[${PYTHON_USEDEP}]"
