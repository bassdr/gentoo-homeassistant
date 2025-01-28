# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/xlwt/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="examples"

distutils_enable_sphinx docs \
	dev-python/pkginfo
distutils_enable_tests pytest

python_install_all() {
	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}
	fi
	distutils-r1_python_install_all
}
