# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 virtualx

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sympy/"
# pypi sdist misses some files, notably top-level conftest.py, as of 1.12.1_rc1
SRC_URI="
	https://github.com/sympy/sympy/archive/${PV/_/}.tar.gz
		-> ${P/_/}.gh.tar.gz
"
S=${WORKDIR}/${P/_/}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="imaging ipython latex mathml opengl pdf png pyglet symengine texmacs"

REQUIRES_DIST="
	hypothesis>=6.70.0; extra == 'dev'
	mpmath<1.4,>=1.1.0
	pytest>=7.1.0; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/mpmath-1.1.0[${PYTHON_USEDEP}] <dev-python/mpmath-1.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/mpmath-1.1.0[${PYTHON_USEDEP}]
	dev-python/pexpect[${PYTHON_USEDEP}]
	imaging? ( dev-python/pillow[${PYTHON_USEDEP}] )
	ipython? (
		dev-python/ipython[${PYTHON_USEDEP}]
	)
	latex? (
		virtual/latex-base
		dev-texlive/texlive-fontsextra
		png? ( app-text/dvipng )
		pdf? ( app-text/ghostscript-gpl )
	)
	mathml? ( dev-python/lxml[${PYTHON_USEDEP}] )
	opengl? ( dev-python/pyopengl[${PYTHON_USEDEP}] )
	pyglet? ( dev-python/pyglet[${PYTHON_USEDEP}] )
	symengine? ( dev-python/symengine[${PYTHON_USEDEP}] )
	texmacs? ( app-office/texmacs )
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/hypothesis-6.70.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.1.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

src_test() {
	virtx distutils-r1_src_test
}

python_test() {
	local EPYTEST_IGNORE=(
		# TODO; virtx?
		sympy/plotting/pygletplot
	)
	local EPYTEST_DESELECT=(
		# require old version of antlr4
		sympy/parsing/tests/test_autolev.py
		sympy/parsing/tests/test_latex.py
		# crash due to assertions in llvm-core/llvm[debug]
		sympy/parsing/tests/test_c_parser.py

		# TODO: pytest?
		sympy/solvers/ode/tests/test_systems.py::test_linear_3eq_order1_type4_long_check
		sympy/solvers/ode/tests/test_systems.py::test_linear_3eq_order1_type4_long_dsolve_dotprodsimp

		# either very slow or hanging
		sympy/solvers/ode/tests/test_systems.py::test_linear_new_order1_type2_de_lorentz_slow_check
		sympy/integrals/tests/test_failing_integrals.py::test_issue_15227
		sympy/matrices/tests/test_matrices.py::test_pinv_rank_deficient_when_diagonalization_fails
		sympy/solvers/ode/tests/test_systems.py::test_nonlinear_3eq_order1_type1
		sympy/solvers/ode/tests/test_systems.py::test_nonlinear_3eq_order1_type3

		# known broken
		# https://github.com/sympy/sympy/issues/26321
		sympy/solvers/tests/test_simplex.py::test_lp
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	nonfatal epytest --veryquickcheck ||
		die -n "Tests failed with ${EPYTHON}"
}

python_install_all() {
	local DOCS=( AUTHORS README.md )

	distutils-r1_python_install_all

	if use texmacs; then
		exeinto /usr/libexec/TeXmacs/bin/
		doexe data/TeXmacs/bin/tm_sympy
		insinto /usr/share/TeXmacs/plugins/sympy/
		doins -r data/TeXmacs/progs
	fi
}
