# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_PN="flit_core"
inherit distutils-r1 pypi

DESCRIPTION="Distribution-building parts of Flit. See flit package for more information"
HOMEPAGE="
  https://pypi.org/project/flit_core/
  Documentation, https://flit.pypa.io
  Source, https://github.com/pypa/flit
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/tomli[${PYTHON_USEDEP}]
	' 3.{9..10})
"
BDEPEND="
	test? ( dev-python/testpath[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

src_prepare() {
	rm -r flit_core/vendor || die
	sed -i -e 's:from \.vendor ::' flit_core/*.py || die
	distutils-r1_src_prepare
}
