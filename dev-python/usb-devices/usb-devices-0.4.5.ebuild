# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Tools for mapping, describing, and resetting USB devices"
HOMEPAGE="
  https://pypi.org/project/usb-devices/
  Bug Tracker, https://github.com/bluetooth-devices/usb-devices/issues
  Changelog, https://github.com/bluetooth-devices/usb-devices/blob/main/CHANGELOG.md
  Documentation, https://usb-devices.readthedocs.io
  Repository, https://github.com/bluetooth-devices/usb-devices
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
