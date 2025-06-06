# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="High availability Bluetooth"
HOMEPAGE="
  https://pypi.org/project/habluetooth/
  Bug Tracker, https://github.com/bluetooth-devices/habluetooth/issues
  Changelog, https://github.com/bluetooth-devices/habluetooth/blob/main/CHANGELOG.md
  Documentation, https://habluetooth.readthedocs.io
  Repository, https://github.com/bluetooth-devices/habluetooth
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	async-interrupt>=1.1.1
	bleak-retry-connector>=3.3.0
	bleak>=0.21.1
	bluetooth-adapters>=0.16.1
	bluetooth-auto-recovery>=1.2.3
	bluetooth-data-tools>=1.16.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/async-interrupt-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.21.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-3.3.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-adapters-0.16.1[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-auto-recovery-1.2.3[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-1.16.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/bleak-0.21.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-3.3.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-1.16.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-adapters-0.16.1[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-auto-recovery-1.2.3[${PYTHON_USEDEP}]
	>=dev-python/async-interrupt-1.1.1[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
