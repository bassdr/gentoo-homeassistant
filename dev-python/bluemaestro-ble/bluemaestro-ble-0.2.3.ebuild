# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="bluemaestro BLE devices"
HOMEPAGE="
  https://pypi.org/project/bluemaestro-ble/
  Bug Tracker, https://github.com/bluetooth-devices/bluemaestro-ble/issues
  Changelog, https://github.com/bluetooth-devices/bluemaestro-ble/blob/main/CHANGELOG.md
  Documentation, https://bluemaestro-ble.readthedocs.io
  Repository, https://github.com/bluetooth-devices/bluemaestro-ble
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	>=dev-python/bluetooth-data-tools-0.1.2[${PYTHON_USEDEP}]
	dev-python/bluetooth-data-tools[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.6.1[${PYTHON_USEDEP}]
	dev-python/bluetooth-sensor-state-data[${PYTHON_USEDEP}]
	docs? ( >=dev-python/myst-parser-0.18[${PYTHON_USEDEP}] )
	>=dev-python/sensor-state-data-2.6.0[${PYTHON_USEDEP}]
	dev-python/sensor-state-data[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-5.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/sensor-state-data-2.6.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-0.1.2[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
