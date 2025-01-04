# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Bluetooth Low Energy platform Agnostic Klient"
HOMEPAGE="
  https://pypi.org/project/bleak/
  Changelog, https://github.com/hbldh/bleak/blob/develop/CHANGELOG.rst
  Documentation, https://bleak.readthedocs.io
  Issues, https://github.com/hbldh/bleak/issues
  Support, https://github.com/hbldh/bleak/discussions
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	dev-python/dbus-fast[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} 
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_{10..11})
	$(python_gen_cond_dep 'dev-python/typing-extensions[${PYTHON_USEDEP}]' python3_11)
	>=dev-python/dbus-fast-1.83.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/asynctest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
