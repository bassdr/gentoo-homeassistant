# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 prefix pypi

DESCRIPTION="Python bindings for the LZO data compression library"
HOMEPAGE="
  https://pypi.org/project/python-lzo/
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm64"

DEPEND="
	dev-libs/lzo:2
"
RDEPEND="
	${DEPEND}
"

distutils_enable_tests pytest

python_prepare_all() {
	hprefixify setup.py
	distutils-r1_python_prepare_all
}
