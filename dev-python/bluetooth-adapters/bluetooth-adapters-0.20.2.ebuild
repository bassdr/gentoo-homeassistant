# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Tools to enumerate and find Bluetooth Adapters"
HOMEPAGE="
  https://pypi.org/project/bluetooth-adapters/
  Bug Tracker, https://github.com/bluetooth-devices/bluetooth-adapters/issues
  Changelog, https://github.com/bluetooth-devices/bluetooth-adapters/blob/main/CHANGELOG.md
  Documentation, https://bluetooth-adapters.readthedocs.io
  Repository, https://github.com/bluetooth-devices/bluetooth-adapters
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aiooui[${PYTHON_USEDEP}]
	dev-python/bleak[${PYTHON_USEDEP}]
	dev-python/uart-devices[${PYTHON_USEDEP}]
	dev-python/usb-devices[${PYTHON_USEDEP}]
	dev-python/dbus-fast[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} 
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_10)
	>=dev-python/dbus-fast-1.21.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.21.1[${PYTHON_USEDEP}]
	>=dev-python/usb-devices-0.4.5[${PYTHON_USEDEP}]
	>=dev-python/aiooui-0.1.1[${PYTHON_USEDEP}]
	>=dev-python/uart-devices-0.1.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
