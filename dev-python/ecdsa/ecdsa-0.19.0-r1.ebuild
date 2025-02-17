# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="ECDSA cryptographic signature library (pure python)"
HOMEPAGE="
  https://pypi.org/project/ecdsa/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="gmpy gmpy2"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	gmpy2; extra == 'gmpy2'
	gmpy; extra == 'gmpy'
	six>=1.9.0
"
GENERATED_RDEPEND="${RDEPEND}
	gmpy? ( dev-python/gmpy[${PYTHON_USEDEP}] )
	gmpy2? ( dev-python/gmpy2[${PYTHON_USEDEP}] )
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	$(python_gen_cond_dep '
		dev-python/gmpy2[${PYTHON_USEDEP}]
	' 'python*')
	dev-python/six[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
