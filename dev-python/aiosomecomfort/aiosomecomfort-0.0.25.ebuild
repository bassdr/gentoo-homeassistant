# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="AIOSomecomfort"
inherit distutils-r1 pypi

DESCRIPTION="A client for Honeywell's US-based cloud devices"
HOMEPAGE="
  https://pypi.org/project/AIOSomecomfort/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	dev-python/prettytable[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/prettytable[${PYTHON_USEDEP}]"
