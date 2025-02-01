# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Parser for the RAPT Pill hydrometer BLE packets."
HOMEPAGE="
  https://pypi.org/project/rapt-ble/
  Bug Tracker, https://github.com/sairon/rapt-ble/issues
  Changelog, https://github.com/sairon/rapt-ble/blob/main/CHANGELOG.md
  Documentation, https://rapt-ble.readthedocs.io
  Repository, https://github.com/sairon/rapt-ble
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/bluetooth-data-tools-0.3.1[${PYTHON_USEDEP}]
	dev-python/bluetooth-data-tools[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.6.1[${PYTHON_USEDEP}]
	dev-python/bluetooth-sensor-state-data[${PYTHON_USEDEP}]
	>=dev-python/home-assistant-bluetooth-1.9.2[${PYTHON_USEDEP}]
	dev-python/home-assistant-bluetooth[${PYTHON_USEDEP}]
	>=dev-python/sensor-state-data-2.13.0[${PYTHON_USEDEP}]
	dev-python/sensor-state-data[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/bluetooth-sensor-state-data-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/home-assistant-bluetooth-1.9.2[${PYTHON_USEDEP}]
	>=dev-python/sensor-state-data-2.13.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-0.3.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
