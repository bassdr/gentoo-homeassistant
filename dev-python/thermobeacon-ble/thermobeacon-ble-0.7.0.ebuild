# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Parser for Thermobeacon devices"
HOMEPAGE="
  https://pypi.org/project/thermobeacon-ble/
  Bug Tracker, https://github.com/bluetooth-devices/thermobeacon-ble/issues
  Changelog, https://github.com/bluetooth-devices/thermobeacon-ble/blob/main/CHANGELOG.md
  Documentation, https://thermobeacon-ble.readthedocs.io
  Repository, https://github.com/bluetooth-devices/thermobeacon-ble
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	Sphinx<6.0,>=5.0; extra == 'docs'
	bluetooth-data-tools>=0.1.2
	bluetooth-sensor-state-data>=1.6.0
	myst-parser<0.19,>=0.18; extra == 'docs'
	sensor-state-data>=2.3.2
	sphinx-rtd-theme<2.0,>=1.0; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/bluetooth-data-tools-0.1.2[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.6.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/myst-parser-0.18[${PYTHON_USEDEP}] <dev-python/myst-parser-0.19[${PYTHON_USEDEP}] )
	>=dev-python/sensor-state-data-2.3.2[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-5.0[${PYTHON_USEDEP}] <dev-python/sphinx-6.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0[${PYTHON_USEDEP}] <dev-python/sphinx-rtd-theme-2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/bluetooth-data-tools-0.1.2[${PYTHON_USEDEP}]
	>=dev-python/sensor-state-data-2.3.2[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.6.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
