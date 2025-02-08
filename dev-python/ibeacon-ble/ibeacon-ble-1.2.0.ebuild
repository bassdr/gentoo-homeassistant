# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
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
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	Sphinx (>=5.0,<6.0) ; extra == "docs"
	aiooui (>=0.1.1)
	home-assistant-bluetooth (>=1.3.0)
	mac-vendor-lookup (>=0.1.11)
	myst-parser (>=0.18,<0.19) ; extra == "docs"
	sphinx-rtd-theme (>=1.0,<2.0) ; extra == "docs"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiooui-0.1.1[${PYTHON_USEDEP}]
	>=dev-python/home-assistant-bluetooth-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/mac-vendor-lookup-0.1.11[${PYTHON_USEDEP}]
	docs? ( >=dev-python/myst-parser-0.18[${PYTHON_USEDEP}] <dev-python/myst-parser-0.19[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-5.0[${PYTHON_USEDEP}] <dev-python/sphinx-6.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0[${PYTHON_USEDEP}] <dev-python/sphinx-rtd-theme-2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/home-assistant-bluetooth-1.3.0[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/mac-vendor-lookup[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
