# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
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
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	Sphinx (>=5.0,<6.0) ; extra == "docs"
	bleak (>=0.19.2)
	bleak-retry-connector (>=2.13.0)
	bluetooth-data-tools (>=0.1.2)
	bluetooth-sensor-state-data (>=1.6.0)
	home-assistant-bluetooth (>=1.6.0)
	myst-parser (>=0.18,<0.19) ; extra == "docs"
	sphinx-rtd-theme (>=1.0,<2.0) ; extra == "docs"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/bleak-0.19.2[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-2.13.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-0.1.2[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/home-assistant-bluetooth-1.6.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/myst-parser-0.18[${PYTHON_USEDEP}] <dev-python/myst-parser-0.19[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-5.0[${PYTHON_USEDEP}] <dev-python/sphinx-6.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0[${PYTHON_USEDEP}] <dev-python/sphinx-rtd-theme-2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/bluetooth-sensor-state-data-1.6.0[${PYTHON_USEDEP}]
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
