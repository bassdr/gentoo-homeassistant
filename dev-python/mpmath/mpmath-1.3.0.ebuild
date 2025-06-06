# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mpmath/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="develop docs gmpy test"
IUSE="${GENERATED_IUSE}"

REQUIRES_DIST="
	codecov ; extra == 'develop'
	gmpy2 (>=2.1.0a4) ; (platform_python_implementation != 'PyPy') and extra == 'gmpy'
	pycodestyle ; extra == 'develop'
	pytest (>=4.6) ; extra == 'develop'
	pytest (>=4.6) ; extra == 'tests'
	pytest-cov ; extra == 'develop'
	sphinx ; extra == 'docs'
	wheel ; extra == 'develop'
"
GENERATED_RDEPEND="${RDEPEND}
	develop? ( dev-python/codecov[${PYTHON_USEDEP}] )
	gmpy? ( >=dev-python/gmpy2-2.1.0_alpha4[${PYTHON_USEDEP}] )
	develop? ( dev-python/pycodestyle[${PYTHON_USEDEP}] )
	develop? ( >=dev-python/pytest-4.6[${PYTHON_USEDEP}] )
	develop? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	develop? ( dev-python/wheel[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

PATCHES=(
	"${FILESDIR}"/${PN}-1.4.0_alpha2-before-numpy-2.patch
)

EPYTEST_XDIST=1
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-4.6[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
BDEPEND+="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pexpect[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/gmpy2[${PYTHON_USEDEP}]
		' 'python3*')
		!mips? (
			dev-python/ipython[${PYTHON_USEDEP}]
			!hppa? (
				dev-python/matplotlib[${PYTHON_USEDEP}]
			)
		)
	)
"

python_test() {
	local EPYTEST_DESELECT=(
		# TODO
		mpmath/tests/test_cli.py::test_bare_console_bare_division
		mpmath/tests/test_cli.py::test_bare_console_no_bare_division
		mpmath/tests/test_cli.py::test_bare_console_pretty
		mpmath/tests/test_cli.py::test_bare_console_without_ipython
		mpmath/tests/test_cli.py::test_bare_console_wrap_floats
	)

	case ${EPYTHON} in
		pypy3)
			EPYTEST_DESELECT+=(
				# minor whitespace mismatch
				# https://github.com/mpmath/mpmath/issues/874
				mpmath/tests/test_format.py::test_mpf_floats_bulk
				mpmath/tests/test_format.py::test_mpc_complexes
			)
			;;
	esac

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p rerunfailures --reruns=5 -p timeout
}

pkg_postinst() {
	optfeature "gmp support" dev-python/gmpy2
	optfeature "matplotlib support" dev-python/matplotlib
}
