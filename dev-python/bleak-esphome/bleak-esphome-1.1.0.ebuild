# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Bleak backend of ESPHome"
HOMEPAGE="
  https://pypi.org/project/bleak-esphome/
  Bug Tracker, https://github.com/bluetooth-devices/bleak-esphome/issues
  Changelog, https://github.com/bluetooth-devices/bleak-esphome/blob/main/CHANGELOG.md
  Documentation, https://bleak-esphome.readthedocs.io
  Repository, https://github.com/bluetooth-devices/bleak-esphome
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aioesphomeapi-22.0.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.21.1[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-1.18.0[${PYTHON_USEDEP}]
	>=dev-python/habluetooth-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/lru-dict-1.2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aioesphomeapi-22.0.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.21.1[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-1.18.0[${PYTHON_USEDEP}]
	>=dev-python/habluetooth-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/lru-dict-1.2.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
