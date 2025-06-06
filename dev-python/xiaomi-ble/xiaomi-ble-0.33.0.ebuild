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
REQUIRES_DIST="
	Sphinx<6.0,>=5.0; extra == 'docs'
	aiohttp>=3.10.0
	bleak-retry-connector>=2.13.0
	bleak>=0.19.5
	bluetooth-data-tools>=0.3.1
	bluetooth-sensor-state-data>=1.6.0
	cryptography>=40.0.0
	home-assistant-bluetooth>=1.9.2
	myst-parser<0.19,>=0.18; extra == 'docs'
	orjson>=3.9.0
	pycryptodomex>=3.19.1
	sensor-state-data>=2.17.1
	sphinx-rtd-theme<2.0,>=1.0; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.10.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.19.5[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-2.13.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-0.3.1[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-40.0.0[${PYTHON_USEDEP}]
	>=dev-python/home-assistant-bluetooth-1.9.2[${PYTHON_USEDEP}]
	docs? ( >=dev-python/myst-parser-0.18[${PYTHON_USEDEP}] <dev-python/myst-parser-0.19[${PYTHON_USEDEP}] )
	>=dev-python/orjson-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodomex-3.19.1[${PYTHON_USEDEP}]
	>=dev-python/sensor-state-data-2.17.1[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-5.0[${PYTHON_USEDEP}] <dev-python/sphinx-6.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0[${PYTHON_USEDEP}] <dev-python/sphinx-rtd-theme-2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
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
