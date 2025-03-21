# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Manage Airthings BLE devices"
HOMEPAGE="
  https://pypi.org/project/airthings-ble/
  Bug Tracker, https://github.com/Airthings/airthings-ble/issues
  Documentation, https://airthings-ble.readthedocs.io
  Repository, https://github.com/Airthings/airthings-ble
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	async-interrupt>=1.1.1
	async-timeout>=4.0.1; python_version < '3.11'
	bleak-retry-connector>=1.8.0
	bleak>=0.15.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/async-interrupt-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.15.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-1.8.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_10)
	>=dev-python/bleak-0.15.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-1.11.0[${PYTHON_USEDEP}]
	>=dev-python/async-interrupt-1.1.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
