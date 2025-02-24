# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="bcrypt fido2 gssapi libnacl pkcs11 pyopenssl pywin32"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sshfs/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	asyncssh<3,>=2.11.0
	asyncssh[bcrypt]; extra == 'bcrypt'
	asyncssh[fido2]; extra == 'fido2'
	asyncssh[gssapi]; extra == 'gssapi'
	asyncssh[libnacl]; extra == 'libnacl'
	asyncssh[pyopenssl]; extra == 'pyopenssl'
	asyncssh[python-pkcs11]; extra == 'pkcs11'
	asyncssh[pywin32]; extra == 'pywin32'
	fsspec>=2021.8.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/asyncssh-2.11.0[${PYTHON_USEDEP}] <dev-python/asyncssh-3[${PYTHON_USEDEP}]
	bcrypt? ( dev-python/asyncssh[bcrypt,${PYTHON_USEDEP}] )
	fido2? ( dev-python/asyncssh[fido2,${PYTHON_USEDEP}] )
	gssapi? ( dev-python/asyncssh[gssapi,${PYTHON_USEDEP}] )
	libnacl? ( dev-python/asyncssh[libnacl,${PYTHON_USEDEP}] )
	pkcs11? ( dev-python/asyncssh[python-pkcs11,${PYTHON_USEDEP}] )
	pyopenssl? ( dev-python/asyncssh[pyopenssl,${PYTHON_USEDEP}] )
	pywin32? ( dev-python/asyncssh[pywin32,${PYTHON_USEDEP}] )
	>=dev-python/fsspec-2021.8.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
