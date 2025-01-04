# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="Measures the displayed width of unicode strings in a terminal"
HOMEPAGE="
  https://pypi.org/project/wcwidth/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest

python_test() {
	epytest -o addopts=
}

python_install_all() {
	docinto docs
	dodoc docs/intro.rst
	distutils-r1_python_install_all
}