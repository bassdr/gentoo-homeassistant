# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Recover bluetooth adapters that are in an stuck state"
HOMEPAGE="
  https://pypi.org/project/bluetooth-auto-recovery/
  Bug Tracker, https://github.com/bluetooth-devices/bluetooth-auto-recovery/issues
  Changelog, https://github.com/bluetooth-devices/bluetooth-auto-recovery/blob/main/CHANGELOG.md
  Documentation, https://bluetooth-auto-recovery.readthedocs.io
  Repository, https://github.com/bluetooth-devices/bluetooth-auto-recovery
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/bluetooth-adapters-0.16.0[${PYTHON_USEDEP}]
	>=dev-python/btsocket-0.2.0[${PYTHON_USEDEP}]
	docs? ( <dev-python/myst-parser-0.19[${PYTHON_USEDEP}] )
	>=dev-python/pyric-0.1.6.3[${PYTHON_USEDEP}]
	docs? ( <dev-python/sphinx-6.0[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-rtd-theme-2.0[${PYTHON_USEDEP}] )
	>=dev-python/usb-devices-0.4.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pyric-0.1.6.3[${PYTHON_USEDEP}]
	>=dev-python/btsocket-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/usb-devices-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-adapters-0.16.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
