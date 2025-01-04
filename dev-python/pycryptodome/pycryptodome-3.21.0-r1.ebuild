# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1

DESCRIPTION="Cryptographic library for Python"
HOMEPAGE="
  https://pypi.org/project/pycryptodome/
  Source, https://github.com/Legrandin/pycryptodome/
  Changelog, https://www.pycryptodome.org/src/changelog
"
SRC_URI="
	https://github.com/Legrandin/pycryptodome/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD-2 Unlicense"
SLOT="0"
KEYWORDS="amd64 arm64"

DEPEND="
	dev-libs/gmp:=
	>=dev-libs/libtomcrypt-1.18.2-r1:=
"
BDEPEND="
	$(python_gen_cond_dep 'dev-python/cffi[${PYTHON_USEDEP}]' 'python*')
"
RDEPEND="
	${DEPEND}
	${BDEPEND}
"

PATCHES=(
	"${FILESDIR}/pycryptodome-3.10.1-system-libtomcrypt.patch"
)

python_prepare_all() {
	# make sure we're unbundling it correctly
	rm -r src/libtom || die

	distutils-r1_python_prepare_all
}

python_test() {
	local -x PYTHONPATH=${S}/test_vectors:${PYTHONPATH}
	"${EPYTHON}" - <<-EOF || die
		import sys
		from Crypto import SelfTest
		SelfTest.run(verbosity=2, stream=sys.stdout)
	EOF

	# TODO: run cmake tests from src/test?
}
