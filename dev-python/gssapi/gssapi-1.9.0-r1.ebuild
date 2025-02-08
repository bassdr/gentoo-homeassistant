# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/gssapi/"
SRC_URI="
	https://github.com/pythongssapi/python-gssapi/releases/download/v${PV}/python-${P}.tar.gz
		-> ${P}.gh.tar.gz
"
S="${WORKDIR}"/python-${P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	decorator
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/decorator[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/decorator[${PYTHON_USEDEP}]
	virtual/krb5
"

BDEPEND="
	>=dev-python/cython-3.0.3[${PYTHON_USEDEP}]
	virtual/krb5
	test? (
		dev-python/k5test[${PYTHON_USEDEP}]
		dev-python/parameterized[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	cd "${T}" || die
	epytest --pyargs gssapi
}
