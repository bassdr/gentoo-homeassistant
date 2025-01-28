# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="AsyncSSH: Asynchronous SSHv2 client and server library"
HOMEPAGE="
  https://pypi.org/project/asyncssh/
  Documentation, https://asyncssh.readthedocs.io
  Source, https://github.com/ronf/asyncssh
  Tracker, https://github.com/ronf/asyncssh/issues
"

LICENSE="ECL-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="bcrypt fido2 gssapi libnacl pkcs11 pyopenssl pywin32"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	bcrypt? ( >=dev-python/bcrypt-3.1.3[${PYTHON_USEDEP}] )
	>=dev-python/cryptography-39.0[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	fido2? ( >=dev-python/fido2-0.9.2[${PYTHON_USEDEP}] )
	gssapi? ( >=dev-python/gssapi-1.2.0[${PYTHON_USEDEP}] )
	libnacl? ( >=dev-python/libnacl-1.4.2[${PYTHON_USEDEP}] )
	pyopenssl? ( >=dev-python/pyopenssl-23.0.0[${PYTHON_USEDEP}] )
	pkcs11? ( >=dev-python/python-pkcs11-0.7.0[${PYTHON_USEDEP}] )
	pywin32? ( >=dev-python/pywin32-227[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/cryptography-2.8[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
