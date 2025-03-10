# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fido2/"
SRC_URI="
	https://github.com/Yubico/python-fido2/releases/download/${PV}/${P}.tar.gz
"

LICENSE="Apache-2.0 BSD-2 MIT MPL-2.0"
SLOT="0/1.0" # Bumped every time a backwards-incompatible version is released
KEYWORDS="amd64 arm64"
GENERATED_IUSE="pcsc"
IUSE="${GENERATED_IUSE} examples"

REQUIRES_DIST="
	cryptography (>=2.6,!=35,<44)
	pyscard (>=1.9,<3) ; extra == 'pcsc'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cryptography-2.6[${PYTHON_USEDEP}] <dev-python/cryptography-44[${PYTHON_USEDEP}] !~dev-python/cryptography-35[${PYTHON_USEDEP}]
	pcsc? ( >=dev-python/pyscard-1.9[${PYTHON_USEDEP}] <dev-python/pyscard-3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/cryptography-45[${PYTHON_USEDEP}]
	<dev-python/pyscard-3[${PYTHON_USEDEP}]
	examples? (
		dev-python/flask[${PYTHON_USEDEP}]
		dev-python/pyopenssl[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_install_all() {
	distutils-r1_python_install_all

	if use examples; then
		docinto examples
		dodoc -r "${S}"/examples/.
		docompress -x "/usr/share/doc/${PF}/examples"
	fi
}
