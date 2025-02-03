# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Python binding to the Networking and Cryptography (NaCl) library"
HOMEPAGE="
  https://pypi.org/project/PyNaCl/
"
SRC_URI="
	https://github.com/pyca/pynacl/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
DEPEND="
	dev-libs/libsodium:=
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/cffi[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	${DEPEND}
	$(python_gen_cond_dep '
		>=dev-python/cffi-1.4.1[${PYTHON_USEDEP}]
	' 'python*')
"
BDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/cffi-1.4.1[${PYTHON_USEDEP}]
	' 'python*')
	test? (
		>=dev-python/hypothesis-3.27.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_compile() {
	# For not using the bundled libsodium
	local -x SODIUM_INSTALL=system
	distutils-r1_src_compile
}
