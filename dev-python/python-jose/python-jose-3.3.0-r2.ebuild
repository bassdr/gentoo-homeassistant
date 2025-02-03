# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="JOSE implementation in Python"
HOMEPAGE="
  https://pypi.org/project/python-jose/
  Documentation, https://python-jose.readthedocs.io/en/latest/
  Source, https://github.com/mpdavis/python-jose/
  Tracker, https://github.com/mpdavis/python-jose/issues/
  Changelog, https://github.com/mpdavis/python-jose/blob/master/CHANGELOG.md
"
# pypi tarball lacks unit tests
SRC_URI="
	https://github.com/mpdavis/python-jose/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

# TODO: require only one crypto backend?
GENERATED_IUSE="cryptography pycrypto pycryptodome"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	cryptography? ( >=dev-python/cryptography-3.4.0[${PYTHON_USEDEP}] )
	!=dev-python/ecdsa-0.15[${PYTHON_USEDEP}]
	dev-python/pyasn1[${PYTHON_USEDEP}]
	pycrypto? ( dev-python/pyasn1[${PYTHON_USEDEP}] )
	pycryptodome? ( dev-python/pyasn1[${PYTHON_USEDEP}] )
	pycrypto? ( <dev-python/pycrypto-2.7.0[${PYTHON_USEDEP}] )
	pycryptodome? ( <dev-python/pycryptodome-4.0.0[${PYTHON_USEDEP}] )
	dev-python/rsa[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/ecdsa[${PYTHON_USEDEP}]
	dev-python/pyasn1[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.3.1[${PYTHON_USEDEP}]
	dev-python/rsa[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
distutils_enable_sphinx docs

python_prepare_all() {
	local PATCHES=(
		# https://github.com/mpdavis/python-jose/commit/19677540e74eba4392be53ae434b561cf74ad9a6
		"${FILESDIR}/${P}-test.patch"
	)

	distutils-r1_python_prepare_all
	sed -e '/pytest-runner/d' -i setup.py || die
	sed -e '/addopts/d' -i setup.cfg || die
}
