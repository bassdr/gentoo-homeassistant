# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYPI_PN="gmpy2"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="gmpy2 interface to GMP, MPFR, and MPC for Python 3.7+"
HOMEPAGE="
  https://pypi.org/project/gmpy2/
  Homepage, https://github.com/aleaxit/gmpy
"

LICENSE="LGPL-3+"
SLOT="2"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs tests"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	tests? ( dev-python/cython[${PYTHON_USEDEP}] )
	tests? ( dev-python/hypothesis[${PYTHON_USEDEP}] )
	tests? ( dev-python/mpmath[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest[${PYTHON_USEDEP}] )
	tests? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1[${PYTHON_USEDEP}] )
"
DEPEND="
	>=dev-libs/mpc-1.0.2:=
	>=dev-libs/mpfr-3.1.2:=
	dev-libs/gmp:0=
"
RDEPEND="
	${DEPEND}
"
BDEPEND="
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/mpmath[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	rm -rf gmpy2 || die

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
