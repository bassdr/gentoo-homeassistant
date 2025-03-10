# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A faster version of dbus-next"
HOMEPAGE="
  https://pypi.org/project/dbus-fast/
  Bug Tracker, https://github.com/bluetooth-devices/dbus-fast/issues
  Changelog, https://github.com/bluetooth-devices/dbus-fast/blob/main/CHANGELOG.md
  Documentation, https://dbus-fast.readthedocs.io
  Repository, https://github.com/bluetooth-devices/dbus-fast
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

BDEPEND="
	>=dev-python/cython-3[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
