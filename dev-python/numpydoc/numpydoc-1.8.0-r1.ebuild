# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=${P/_}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/numpydoc/"
SRC_URI="
	https://github.com/numpy/numpydoc/archive/v${PV/_}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="developer doc test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	doc? ( dev-python/intersphinx-registry[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/matplotlib-3.5[${PYTHON_USEDEP}] )
	test? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/numpy-1.22[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/pydata-sphinx-theme-0.13.3[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-6[${PYTHON_USEDEP}]
	doc? ( >=dev-python/sphinx-7[${PYTHON_USEDEP}] )
	>=dev-python/tabulate-0.8.10[${PYTHON_USEDEP}]
	developer? ( >=dev-vcs/pre-commit-3.3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/sphinx-6[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.8.10[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/tomli-1.1.0[${PYTHON_USEDEP}]
	' 3.10)
"
BDEPEND="
	test? (
		>=dev-python/matplotlib-3.2.1[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# these require Internet (intersphinx)
		numpydoc/tests/test_full.py::test_MyClass
		numpydoc/tests/test_full.py::test_my_function
		# TODO
		numpydoc/tests/test_validate.py::test_extract_ignore_validation_comments
	)
	epytest -o addopts= --pyargs numpydoc
}
