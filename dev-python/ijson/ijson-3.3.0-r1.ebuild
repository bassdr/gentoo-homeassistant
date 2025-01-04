# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="Iterative JSON parser with standard Python iterator interfaces"
HOMEPAGE="
  https://pypi.org/project/ijson/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

DEPEND="
	dev-libs/yajl:=
"
RDEPEND="
	${DEPEND}
"

distutils_enable_tests pytest

export IJSON_BUILD_YAJL2C=1

python_test() {
	rm -rf ijson || die
	epytest
}
