# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Control a wide range of LED BLE devices"
HOMEPAGE="
  https://pypi.org/project/led-ble/
  Bug Tracker, https://github.com/bluetooth-devices/led-ble/issues
  Changelog, https://github.com/bluetooth-devices/led-ble/blob/main/CHANGELOG.md
  Documentation, https://led-ble.readthedocs.io
  Repository, https://github.com/bluetooth-devices/led-ble
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	Sphinx<6.0,>=5.0; extra == 'docs'
	async-timeout>=3.0.0; python_version < '3.11'
	bleak-retry-connector>=2.3.0
	bleak>=0.19.0
	flux-led>=0.28.32
	myst-parser<0.19,>=0.18; extra == 'docs'
	sphinx-rtd-theme<2.0,>=1.0; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/bleak-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/flux-led-0.28.32[${PYTHON_USEDEP}]
	docs? ( >=dev-python/myst-parser-0.18[${PYTHON_USEDEP}] <dev-python/myst-parser-0.19[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-5.0[${PYTHON_USEDEP}] <dev-python/sphinx-6.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0[${PYTHON_USEDEP}] <dev-python/sphinx-rtd-theme-2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/bleak-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-2.3.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_10)
	>=dev-python/flux-led-0.28.32[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
