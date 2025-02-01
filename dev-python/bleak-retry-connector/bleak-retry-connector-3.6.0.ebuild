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
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/bleak-0.21.0[${PYTHON_USEDEP}]
	dev-python/bleak[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-adapters-0.15.2[${PYTHON_USEDEP}]
	dev-python/bluetooth-adapters[${PYTHON_USEDEP}]
	>=dev-python/dbus-fast-1.14.0[${PYTHON_USEDEP}]
	dev-python/dbus-fast[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
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
