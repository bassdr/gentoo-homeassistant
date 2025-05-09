# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A library to interface with the opentherm gateway through serial or network connection."
HOMEPAGE="
  https://pypi.org/project/pyotgw/
"
MY_PV="${PV/_beta/b}"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	pyserial-asyncio-fast
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/pyserial-asyncio-fast[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/pyserial-asyncio-fast[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
