# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="Bluetooth control of Yale and August locks"
HOMEPAGE="
  https://pypi.org/project/yalexs-ble/
  Bug Tracker, https://github.com/bdraco/yalexs-ble/issues
  Changelog, https://github.com/bdraco/yalexs-ble/blob/main/CHANGELOG.md
  Documentation, https://yalexs-ble.readthedocs.io
  Repository, https://github.com/bdraco/yalexs-ble
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	>=dev-python/async-interrupt-1.1.1[${PYTHON_USEDEP}]
	dev-python/async-interrupt[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.19.0[${PYTHON_USEDEP}]
	dev-python/bleak[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-3.4.0[${PYTHON_USEDEP}]
	dev-python/bleak-retry-connector[${PYTHON_USEDEP}]
	>=dev-python/cryptography-38.0.0[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	>=dev-python/lru-dict-1.1.4[${PYTHON_USEDEP}]
	dev-python/lru-dict[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/bleak-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-3.4.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/async-timeout-3.0.0[${PYTHON_USEDEP}]' python3_10)
	>=dev-python/cryptography-38.0.0[${PYTHON_USEDEP}]
	>=dev-python/lru-dict-1.1.4[${PYTHON_USEDEP}]
	>=dev-python/async-interrupt-1.1.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
