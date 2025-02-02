# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python CoAP library"
HOMEPAGE="
  https://pypi.org/project/aiocoap/
  homepage, https://christian.amsuess.com/tools/aiocoap/
  repository, https://codeberg.org/aiocoap/aiocoap
  documentation, https://aiocoap.readthedocs.org/
  changelog, https://codeberg.org/aiocoap/aiocoap/src/branch/main/NEWS.rst
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="all docs oscore prettyprint tinydtls ws"
IUSE="${GENERATED_IUSE} oscore test tinydtls ws"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="${RDEPEND}
	all? ( dev-python/cbor-diag[${PYTHON_USEDEP}] )
	prettyprint? ( dev-python/cbor-diag[${PYTHON_USEDEP}] )
	all? ( dev-python/cbor2[${PYTHON_USEDEP}] )
	oscore? ( dev-python/cbor2[${PYTHON_USEDEP}] )
	prettyprint? ( dev-python/cbor2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/cryptography-2.5[${PYTHON_USEDEP}] )
	oscore? ( >=dev-python/cryptography-2.5[${PYTHON_USEDEP}] )
	all? ( >=dev-python/dtlssocket-0.1.18[${PYTHON_USEDEP}] )
	tinydtls? ( >=dev-python/dtlssocket-0.1.18[${PYTHON_USEDEP}] )
	all? ( dev-python/filelock[${PYTHON_USEDEP}] )
	oscore? ( dev-python/filelock[${PYTHON_USEDEP}] )
	all? ( dev-python/ge25519[${PYTHON_USEDEP}] )
	oscore? ( dev-python/ge25519[${PYTHON_USEDEP}] )
	all? ( ~dev-python/lakers-python-0.4.1[${PYTHON_USEDEP}] )
	oscore? ( ~dev-python/lakers-python-0.4.1[${PYTHON_USEDEP}] )
	all? ( dev-python/pygments[${PYTHON_USEDEP}] )
	prettyprint? ( >=dev-python/pygments-2.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-5[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-argparse[${PYTHON_USEDEP}] )
	all? ( <dev-python/websockets-14[${PYTHON_USEDEP}] )
	ws? ( <dev-python/websockets-14[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	oscore? ( dev-python/cbor2[${PYTHON_USEDEP}] dev-python/cryptography[${PYTHON_USEDEP}] dev-python/filelock[${PYTHON_USEDEP}]  )
	tinydtls? ( >=dev-python/DTLSSocket-0.1.11_alpha1[${PYTHON_USEDEP}] )
	ws? ( dev-python/websockets[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
