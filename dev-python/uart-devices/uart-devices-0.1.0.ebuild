# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="UART Devices for Linux"
HOMEPAGE="
  https://pypi.org/project/uart-devices/
  Bug Tracker, https://github.com/bdraco/uart-devices/issues
  Changelog, https://github.com/bdraco/uart-devices/blob/main/CHANGELOG.md
  Documentation, https://uart-devices.readthedocs.io
  Repository, https://github.com/bdraco/uart-devices
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
