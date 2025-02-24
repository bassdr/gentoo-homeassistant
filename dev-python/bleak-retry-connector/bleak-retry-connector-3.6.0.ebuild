# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A connector for Bleak Clients that handles transient connection failures"
HOMEPAGE="
  https://pypi.org/project/bleak-retry-connector/
  Bug Tracker, https://github.com/bluetooth-devices/bleak-retry-connector/issues
  Changelog, https://github.com/bluetooth-devices/bleak-retry-connector/blob/main/CHANGELOG.md
  Documentation, https://bleak-retry-connector.readthedocs.io
  Repository, https://github.com/bluetooth-devices/bleak-retry-connector
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	async-timeout>=3.0.0; python_version < '3.11'
	bleak>=0.21.0
	bluetooth-adapters>=0.15.2; platform_system == 'Linux'
	dbus-fast>=1.14.0; platform_system == 'Linux'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/bleak-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-adapters-0.15.2[${PYTHON_USEDEP}]
	>=dev-python/dbus-fast-1.14.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/bleak-0.21.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_10)
	>=dev-python/dbus-fast-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-adapters-0.15.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
