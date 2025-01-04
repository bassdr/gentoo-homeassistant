# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Parser for iBeacon devices"
HOMEPAGE="
  https://pypi.org/project/ibeacon-ble/
  Bug Tracker, https://github.com/bluetooth-devices/ibeacon-ble/issues
  Changelog, https://github.com/bluetooth-devices/ibeacon-ble/blob/main/CHANGELOG.md
  Documentation, https://ibeacon-ble.readthedocs.io
  Repository, https://github.com/bluetooth-devices/ibeacon-ble
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/home-assistant-bluetooth[${PYTHON_USEDEP}]
	dev-python/mac-vendor-lookup[${PYTHON_USEDEP}]
	dev-python/aiooui[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/home-assistant-bluetooth-1.3.0[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/mac-vendor-lookup[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
