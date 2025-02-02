# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Models for storing and converting Bluetooth Sensor State Data"
HOMEPAGE="
  https://pypi.org/project/bluetooth-sensor-state-data/
  Bug Tracker, https://github.com/bluetooth-devices/bluetooth-sensor-state-data/issues
  Changelog, https://github.com/bluetooth-devices/bluetooth-sensor-state-data/blob/main/CHANGELOG.md
  Documentation, https://bluetooth-sensor-state-data.readthedocs.io
  Repository, https://github.com/bluetooth-devices/bluetooth-sensor-state-data
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/home-assistant-bluetooth-1.3.0[${PYTHON_USEDEP}]
	docs? ( <dev-python/myst-parser-0.19[${PYTHON_USEDEP}] )
	>=dev-python/sensor-state-data-2.0[${PYTHON_USEDEP}]
	docs? ( <dev-python/sphinx-6.0[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-rtd-theme-2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/home-assistant-bluetooth-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/sensor-state-data-2.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
