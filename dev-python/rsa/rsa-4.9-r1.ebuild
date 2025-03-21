# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=python-rsa-version-${PV}
DESCRIPTION="Pure-Python RSA implementation"
HOMEPAGE="
  https://pypi.org/project/rsa/
  Repository, https://github.com/sybrenstuvel/python-rsa
"
SRC_URI="
	https://github.com/sybrenstuvel/python-rsa/archive/version-${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	pyasn1 (>=0.1.3)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pyasn1-0.1.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pyasn1-0.1.3[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest

src_prepare() {
	rm tests/test_mypy.py || die
	distutils-r1_src_prepare
}
