# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
PYPI_PN="SecretStorage"
inherit distutils-r1 pypi

DESCRIPTION="Python bindings to FreeDesktop.org Secret Service API"
HOMEPAGE="
  https://pypi.org/project/SecretStorage/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cryptography-2.0[${PYTHON_USEDEP}]
	>=dev-python/jeepney-0.6[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/cryptography[${PYTHON_USEDEP}]
	>=dev-python/jeepney-0.6[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		!hppa? ( !sparc? ( !s390? (
			sys-apps/dbus
			virtual/secret-service
		) ) )
	)
"

distutils_enable_tests unittest
distutils_enable_sphinx docs \
	dev-python/alabaster

src_test() {

	if ! has_version "virtual/secret-service"; then
		einfo "gnome-keyring is not supported on ${ARCH}, skipping tests"
		return
	fi

	distutils-r1_src_test
}

python_test() {
	dbus-run-session "${EPYTHON}" -m unittest discover -v -s tests \
		|| die "tests failed with ${EPYTHON}"
}
