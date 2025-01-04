# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python API for talking to Monoprice 6-zone amplifier"
HOMEPAGE="
  https://pypi.org/project/pymonoprice/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

#DOCS="README.md"

GENERATED_DEPEND="
	dev-python/pyserial-asyncio[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/pyserial-3.4[${PYTHON_USEDEP}]
	>=dev-python/pyserial-asyncio-0.4[${PYTHON_USEDEP}]"

distutils_enable_tests pytest