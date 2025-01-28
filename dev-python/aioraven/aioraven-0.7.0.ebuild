# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous communication with Rainforest RAVEn devices."
HOMEPAGE="
  https://pypi.org/project/aioraven/
  Homepage, https://github.com/cottsay/aioraven
  Changelog, https://github.com/cottsay/aioraven/blob/main/CHANGELOG.md
  GitHub, https://github.com/cottsay/aioraven
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/iso4217[${PYTHON_USEDEP}]
	>=dev-python/pyserial-2.5[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio-fast[${PYTHON_USEDEP}]
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/iso4217[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio-fast[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
