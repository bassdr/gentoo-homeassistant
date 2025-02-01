# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

FORTRAN_NEEDED=fortran
DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=meson-python
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit flag-o-matic fortran-2 distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/scipy/"

if [[ ${PV} == *9999* ]] ; then
	inherit git-r3

	# Need submodules, so git for now.
	EGIT_REPO_URI="https://github.com/scipy/scipy"
	EGIT_BRANCH="maintenance/$(ver_cut 1-2).x"
	EGIT_SUBMODULES=( '*' )
else
	inherit pypi

	# Upstream is often behind with doc updates
	DOC_PV=1.14.0

	SRC_URI+="
		doc? (
			https://docs.scipy.org/doc/${PN}-${DOC_PV}/${PN}-html-${DOC_PV}.zip
		)"

	if [[ ${PV} != *rc* ]] ; then
KEYWORDS="amd64 arm64"
	fi
fi

LICENSE="BSD LGPL-2"
SLOT="0"
GENERATED_IUSE="doc"
IUSE="${GENERATED_IUSE} doc +fortran test-rust"

# umfpack is technically optional but it's preferred to have it available.
GENERATED_DEPEND="${PYTHON_DEPS}
	doc? ( dev-python/intersphinx-registry[${PYTHON_USEDEP}] )
	doc? ( dev-python/jupyterlite-pyodide-kernel[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jupyterlite-sphinx-0.16.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/jupytext[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/matplotlib-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/myst-nb[${PYTHON_USEDEP}] )
	<dev-python/numpy-2.5[${PYTHON_USEDEP}]
	doc? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	doc? ( dev-python/pooch[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/pydata-sphinx-theme-0.15.2[${PYTHON_USEDEP}] )
	doc? ( <dev-python/sphinx-8.0.0[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-design-0.4.0[${PYTHON_USEDEP}] )
"
DEPEND="
	>=dev-python/numpy-1.23.5:=[lapack,${PYTHON_USEDEP}]
	sci-libs/arpack:=
	sci-libs/umfpack
	virtual/cblas
	>=virtual/lapack-3.8
"
RDEPEND="${GENERATED_DEPEND}
	${DEPEND}
	dev-python/pillow[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-lang/swig
	>=dev-python/cython-3.0.8[${PYTHON_USEDEP}]
	>=dev-python/meson-python-0.15.0[${PYTHON_USEDEP}]
	>=dev-python/pybind11-2.12.0[${PYTHON_USEDEP}]
	>=dev-build/meson-1.1.0
	!kernel_Darwin? ( dev-util/patchelf )
	virtual/pkgconfig
	doc? ( app-arch/unzip )
	fortran? (
		>=dev-python/pythran-0.16.0[${PYTHON_USEDEP}]
	)
	test? (
		>=dev-python/hypothesis-6.30[${PYTHON_USEDEP}]
	)
	test-rust? (
		dev-python/pooch[${PYTHON_USEDEP}]
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest
BDEPEND+=" test? (
	<dev-python/array-api-strict-2.1.1[${PYTHON_USEDEP}]
	dev-python/asv[${PYTHON_USEDEP}]
	dev-python/cython[${PYTHON_USEDEP}]
	>=dev-python/cython-lint-0.12.2[${PYTHON_USEDEP}]
	>=dev-python/doit-0.36.0[${PYTHON_USEDEP}]
	dev-python/gmpy2[${PYTHON_USEDEP}]
	>=dev-python/hypothesis-6.30[${PYTHON_USEDEP}]
	dev-python/meson[${PYTHON_USEDEP}]
	dev-python/mpmath[${PYTHON_USEDEP}]
	~dev-python/mypy-1.10.0[${PYTHON_USEDEP}]
	dev-python/pooch[${PYTHON_USEDEP}]
	dev-python/pycodestyle[${PYTHON_USEDEP}]
	dev-python/pydevtool[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/pytest-timeout[${PYTHON_USEDEP}]
	dev-python/pytest-xdist[${PYTHON_USEDEP}]
	dev-python/rich-click[${PYTHON_USEDEP}]
	>=dev-python/ruff-0.0.292[${PYTHON_USEDEP}]
	dev-python/scikit-umfpack[${PYTHON_USEDEP}]
	dev-python/threadpoolctl[${PYTHON_USEDEP}]
	dev-python/types-psutil[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
)"

src_unpack() {
	default

	if use doc; then
		unzip -qo "${DISTDIR}"/${PN}-html-${DOC_PV}.zip -d html || die
	fi
}

python_configure_all() {
	DISTUTILS_ARGS=(
		-Dblas=blas
		-Dlapack=lapack
		-Duse-pythran=$(usex fortran true false)
	)

	# https://bugs.gentoo.org/932721
	has_version '>=dev-python/numpy-2.0.0' && filter-lto
}

python_test() {
	cd "${BUILD_DIR}/install$(python_get_sitedir)" || die

	local EPYTEST_DESELECT=(
		# Network
		scipy/datasets/tests/test_data.py::TestDatasets::test_existence_all
		scipy/datasets/tests/test_data.py::TestDatasets::test_ascent
		scipy/datasets/tests/test_data.py::TestDatasets::test_face
		scipy/datasets/tests/test_data.py::TestDatasets::test_electrocardiogram

		# Precision issue with diff. blas?
		scipy/optimize/tests/test__basinhopping.py::Test_Metropolis::test_gh7799

		# Crashes with assertion, not a regression
		# https://github.com/scipy/scipy/issues/19321
		scipy/signal/tests/test_signaltools.py::test_lfilter_bad_object

		# timeouts
		scipy/sparse/linalg/tests/test_propack.py::test_examples
		# hang or incredibly slow
		scipy/optimize/tests/test_lsq_linear.py::TestBVLS::test_large_rank_deficient
		scipy/optimize/tests/test_lsq_linear.py::TestTRF::test_large_rank_deficient

		# TODO
		scipy/optimize/tests/test_minimize_constrained.py::TestTrustRegionConstr::test_list_of_problems
	)
	local EPYTEST_IGNORE=()

	if ! has_version -b "dev-python/pooch[${PYTHON_USEDEP}]" ; then
		EPYTEST_IGNORE+=(
			scipy/datasets/tests/test_data.py
		)
	fi

	case ${EPYTHON} in
		pypy3)
			EPYTEST_DESELECT+=(
				# fd leaks in tests
				# https://github.com/scipy/scipy/issues/19553
				scipy/fft/_pocketfft/tests/test_real_transforms.py
				# TODO
				'scipy/special/tests/test_data.py::test_boost[<Data for expi: expinti_data_long_ipp-expinti_data_long>]'
				# missing dict.__ror__
				# https://github.com/pypy/pypy/issues/4934
				'scipy/sparse/tests/test_dok.py::test_dunder_ror[dok_matrix]'
				# mismatched exception message
				scipy/optimize/tests/test_hessian_update_strategy.py::TestHessianUpdateStrategy::test_initialize_catch_illegal
			)
			;;
	esac

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest scipy
}

python_install_all() {
	use doc && local HTML_DOCS=( "${WORKDIR}"/html/. )

	distutils-r1_python_install_all
}
