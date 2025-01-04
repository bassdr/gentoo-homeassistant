# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Parser for SensorPush BLE devices"
HOMEPAGE="
  https://pypi.org/project/sensorpush-ble/
  Bug Tracker, https://github.com/bluetooth-devices/sensorpush-ble/issues
  Changelog, https://github.com/bluetooth-devices/sensorpush-ble/blob/main/CHANGELOG.md
  Documentation, https://sensorpush-ble.readthedocs.io
  Repository, https://github.com/bluetooth-devices/sensorpush-ble
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/sensor-state-data[${PYTHON_USEDEP}]
	dev-python/bluetooth-sensor-state-data[${PYTHON_USEDEP}]
	dev-python/bluetooth-data-tools[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/bluetooth-sensor-state-data-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/sensor-state-data-2.0.2[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-1.19.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
