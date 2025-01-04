# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Bluetooth library for Oral B devices"
HOMEPAGE="
  https://pypi.org/project/oralb-ble/
  Bug Tracker, https://github.com/Bluetooth-Devices/oralb-ble/issues
  Changelog, https://github.com/Bluetooth-Devices/oralb-ble/blob/main/CHANGELOG.md
  Documentation, https://oralb-ble.readthedocs.io
  Repository, https://github.com/Bluetooth-Devices/oralb-ble
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/bluetooth-sensor-state-data[${PYTHON_USEDEP}]
	dev-python/home-assistant-bluetooth[${PYTHON_USEDEP}]
	dev-python/bleak[${PYTHON_USEDEP}]
	dev-python/bleak-retry-connector[${PYTHON_USEDEP}]
	dev-python/bluetooth-data-tools[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/bluetooth-sensor-state-data-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-0.1.2[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.19.2[${PYTHON_USEDEP}]
	>=dev-python/home-assistant-bluetooth-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-2.13.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
