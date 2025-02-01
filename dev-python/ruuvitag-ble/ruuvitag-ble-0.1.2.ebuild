# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Manage Ruuvitag BLE devices"
HOMEPAGE="
  https://pypi.org/project/ruuvitag-ble/
  Bug Tracker, https://github.com/bluetooth-devices/ruuvitag-ble/issues
  Changelog, https://github.com/bluetooth-devices/ruuvitag-ble/blob/main/CHANGELOG.md
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/bluetooth-data-tools-0.1[${PYTHON_USEDEP}]
	dev-python/bluetooth-data-tools[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.6[${PYTHON_USEDEP}]
	dev-python/bluetooth-sensor-state-data[${PYTHON_USEDEP}]
	>=dev-python/home-assistant-bluetooth-1.6[${PYTHON_USEDEP}]
	dev-python/home-assistant-bluetooth[${PYTHON_USEDEP}]
	>=dev-python/sensor-state-data-2.9[${PYTHON_USEDEP}]
	dev-python/sensor-state-data[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/bluetooth-data-tools-0.1.2[${PYTHON_USEDEP}]
	>=dev-python/sensor-state-data-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/home-assistant-bluetooth-1.6.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
