# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/requests-kerberos/"
SRC_URI="
	https://github.com/requests/${PN}/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	cryptography>=1.3
	pyspnego[kerberos]
	requests>=1.1.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cryptography-1.3[${PYTHON_USEDEP}]
	dev-python/pyspnego[kerberos,${PYTHON_USEDEP}]
	>=dev-python/requests-1.1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/cryptography[${PYTHON_USEDEP}]
	>=dev-python/requests-1.1.0[${PYTHON_USEDEP}]
	dev-python/pyspnego[${PYTHON_USEDEP}]
	dev-python/gssapi[${PYTHON_USEDEP}]
	dev-python/krb5[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
