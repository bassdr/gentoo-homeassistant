# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=${P/_p/.post}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pythran/"
SRC_URI="
	https://github.com/serge-sans-paille/pythran/archive/${PV/_p/.post}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	beniget~=0.4.0
	cython; extra == 'test'
	gast~=0.6.0
	guzzle-sphinx-theme; extra == 'doc'
	ipython; extra == 'test'
	meson; extra == 'test'
	nbsphinx; extra == 'doc'
	nbval; extra == 'test'
	ninja; extra == 'test'
	numpy
	numpy; extra == 'doc'
	packaging; extra == 'test'
	ply>=3.4
	scipy; extra == 'doc'
	setuptools
	wheel; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/beniget-0.4.0[${PYTHON_USEDEP}] =dev-python/beniget-0.4*[${PYTHON_USEDEP}]
	>=dev-python/gast-0.6.0[${PYTHON_USEDEP}] =dev-python/gast-0.6*[${PYTHON_USEDEP}]
	doc? ( dev-python/guzzle-sphinx-theme[${PYTHON_USEDEP}] )
	doc? ( dev-python/nbsphinx[${PYTHON_USEDEP}] )
	dev-python/numpy[${PYTHON_USEDEP}]
	doc? ( dev-python/numpy[${PYTHON_USEDEP}] )
	>=dev-python/ply-3.4[${PYTHON_USEDEP}]
	doc? ( dev-python/scipy[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-libs/boost
	dev-cpp/xsimd
	=dev-python/beniget-0.4*[${PYTHON_USEDEP}]
	=dev-python/gast-0.6*[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/ply-3.4[${PYTHON_USEDEP}]
	>=dev-python/setuptools-73.0.1[${PYTHON_USEDEP}]
"
DEPEND="
	test? (
		dev-libs/boost
		dev-cpp/xsimd
	)
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-build/meson[${PYTHON_USEDEP}]
		dev-python/cython[${PYTHON_USEDEP}]
		dev-python/ipython[${PYTHON_USEDEP}]
		dev-python/nbval[${PYTHON_USEDEP}]
		dev-build/ninja[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/ipython[${PYTHON_USEDEP}]
		dev-python/pip[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
		virtual/cblas
		!!dev-python/setuptools-declarative-requirements
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

src_configure() {
	# vendored C++ headers -- use system copies
	rm -r pythran/{boost,xsimd} || die

	if use test ; then
		# https://bugs.gentoo.org/916461
		sed -i \
			-e 's|blas=blas|blas=cblas|' \
			-e 's|libs=|libs=cblas|' \
			pythran/pythran-*.cfg || die
	fi
}

python_test() {
	local -x COLUMNS=80
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1

	local EPYTEST_DESELECT=(
		# TODO
		pythran/tests/test_numpy_ufunc_unary.py::TestNumpyUFuncUnary::test_signbit0
	)

	if has_version ">=dev-python/numpy-2[${PYTHON_USEDEP}]"; then
		case ${EPYTHON} in
			pypy3)
				EPYTEST_DESELECT+=(
					pythran/tests/test_distutils.py::TestDistutils::test_setup_bdist_install3
					pythran/tests/test_distutils.py::TestDistutils::test_setup_build3
					pythran/tests/test_distutils.py::TestDistutils::test_setup_sdist_install
					pythran/tests/test_distutils.py::TestDistutils::test_setup_sdist_install2
					pythran/tests/test_distutils.py::TestDistutils::test_setup_sdist_install3
					pythran/tests/test_distutils.py::TestMeson::test_meson_build
					pythran/tests/test_exception.py::TestException::test_multiple_tuple_exception_register
					pythran/tests/test_ndarray.py::TestNdarray::test_ndarray_fancy_indexing1
					pythran/tests/test_numpy_fft.py::TestNumpyFFTN::test_fftn_1
					pythran/tests/test_numpy_func0.py::TestNumpyFunc0::test_ravel0
					pythran/tests/test_numpy_func3.py::TestNumpyFunc3::test_list_imag0
					pythran/tests/test_numpy_random.py::TestNumpyRandom::test_numpy_uniform_size_int
					pythran/tests/test_set.py::TestSet::test_fct_symmetric_difference_update
				)
				;;
			python3.13)
				EPYTEST_DESELECT+=(
					# repr() differences?
					pythran/tests/test_xdoc.py::TestDoctest::test_tutorial
				)
		esac
	fi

	epytest
}
