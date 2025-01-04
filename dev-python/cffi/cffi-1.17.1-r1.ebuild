# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )
# pypy bundles a modified version of cffi. Use python_gen_cond_dep instead.
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 toolchain-funcs pypi

DESCRIPTION="Foreign Function Interface for Python calling C code."
HOMEPAGE="
  https://pypi.org/project/cffi/
  Documentation, http://cffi.readthedocs.org/
  Source Code, https://github.com/python-cffi/cffi
  Issue Tracker, https://github.com/python-cffi/cffi/issues
  Changelog, https://cffi.readthedocs.io/en/latest/whatsnew.html
  Downloads, https://github.com/python-cffi/cffi/releases
  Contact, https://groups.google.com/forum/#!forum/python-cffi
"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="amd64 arm64"

# Needs recent libffi for HPPA fixes
GENERATED_DEPEND="
	dev-python/pycparser[${PYTHON_USEDEP}]
"
DEPEND="
	>=dev-libs/libffi-3.4.4-r1:=
"
# setuptools as a modern distutils provider
RDEPEND="${GENERATED_DEPEND}  
	${DEPEND}
	dev-python/pycparser[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
	virtual/pkgconfig
	test? (
		dev-python/py[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx doc/source
distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/cffi-1.14.0-darwin-no-brew.patch
)

src_prepare() {
	if [[ ${CHOST} == *darwin* ]] ; then
		# Don't obsessively try to find libffi
		sed -i -e "s/.*\-iwithsysroot\/usr\/include\/ffi.*/\tpass/" setup.py || die
	fi
	distutils-r1_src_prepare
}

src_configure() {
	tc-export PKG_CONFIG
}

python_test() {
	local EPYTEST_IGNORE=(
		# these tests call pip
		testing/cffi0/test_zintegration.py
	)

	"${EPYTHON}" -c "import _cffi_backend as backend" || die
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest src/c testing
}
