# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pygit2/"

LICENSE="GPL-2-with-linking-exception"
SLOT="0"
KEYWORDS="amd64 arm64"

DEPEND="
	<dev-libs/libgit2-1.10:=
	>=dev-libs/libgit2-1.9.0:=
"
BDEPEND="
	>=dev-python/cffi-1.17.0:=[${PYTHON_USEDEP}]
"
REQUIRES_DIST="
	cffi>=1.17.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cffi-1.17.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	${DEPEND}
	${BDEPEND}
"

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	# unconditionally prevent it from using network
	sed -i -e '/has_network/s:True:False:' test/utils.py || die
}

src_test() {
	rm -r pygit2 || die
	distutils-r1_src_test
}
