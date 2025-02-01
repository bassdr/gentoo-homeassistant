# Copyright 2020-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=meson-python
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/scikit-learn/"
SRC_URI="
	https://github.com/scikit-learn/scikit-learn/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="benchmark build docs examples install maintenance tests"
IUSE="${GENERATED_IUSE} examples"

GENERATED_DEPEND="${PYTHON_DEPS}
	tests? ( >=dev-python/black-24.3.0[${PYTHON_USEDEP}] )
	maintenance? ( ~dev-python/conda-lock-2.5.6[${PYTHON_USEDEP}] )
	build? ( >=dev-python/cython-3.0.10[${PYTHON_USEDEP}] )
	>=dev-python/joblib-1.2.0[${PYTHON_USEDEP}]
	install? ( >=dev-python/joblib-1.2.0[${PYTHON_USEDEP}] )
	benchmark? ( >=dev-python/matplotlib-3.3.4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/matplotlib-3.3.4[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/matplotlib-3.3.4[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/matplotlib-3.3.4[${PYTHON_USEDEP}] )
	benchmark? ( >=dev-python/memory-profiler-0.57.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/memory-profiler-0.57.0[${PYTHON_USEDEP}] )
	build? ( >=dev-python/meson-python-0.16.0[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/mypy-1.9[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.19.5[${PYTHON_USEDEP}]
	build? ( >=dev-python/numpy-1.19.5[${PYTHON_USEDEP}] )
	install? ( >=dev-python/numpy-1.19.5[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/numpydoc-1.2.0[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/numpydoc-1.2.0[${PYTHON_USEDEP}] )
	benchmark? ( >=dev-python/pandas-1.1.5[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pandas-1.1.5[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/pandas-1.1.5[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pandas-1.1.5[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pillow-7.1.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/plotly-5.14.0[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/plotly-5.14.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/polars-0.20.30[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/polars-0.20.30[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pooch-1.6.0[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/pooch-1.6.0[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pooch-1.6.0[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pyamg-4.0.0[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pyarrow-12.0.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pydata-sphinx-theme-0.15.3[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pytest-7.1.2[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pytest-cov-2.9.0[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/ruff-0.5.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/scikit-image-0.17.2[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/scikit-image-0.17.2[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/scikit-image-0.17.2[${PYTHON_USEDEP}] )
	>=dev-python/scipy-1.6.0[${PYTHON_USEDEP}]
	build? ( >=dev-python/scipy-1.6.0[${PYTHON_USEDEP}] )
	install? ( >=dev-python/scipy-1.6.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/seaborn-0.9.0[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/seaborn-0.9.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-7.3.7[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-copybutton-0.5.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-design-0.5.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-design-0.6.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-gallery-0.17.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-prompt-1.4.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-remove-toctrees-1.0.0_p1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxcontrib-sass-0.3.4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxext-opengraph-0.9.1[${PYTHON_USEDEP}] )
	>=dev-python/threadpoolctl-3.1.0[${PYTHON_USEDEP}]
	install? ( >=dev-python/threadpoolctl-3.1.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/towncrier-24.8.0[${PYTHON_USEDEP}] )
"
DEPEND="
	virtual/blas:=
	virtual/cblas:=
	>=dev-python/numpy-1.19.5:=[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	${DEPEND}
	>=dev-python/joblib-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/threadpoolctl-3.1.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/pythran-0.14.0[${PYTHON_USEDEP}]
	>=dev-python/cython-3.0.10[${PYTHON_USEDEP}]
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

# For some reason this wants to use urllib to fetch things from the internet
# distutils_enable_sphinx doc \
# 	dev-python/matplotlib \
# 	dev-python/memory-profiler \
# 	dev-python/numpydoc \
# 	dev-python/pandas \
# 	dev-python/pillow \
# 	dev-python/seaborn \
# 	dev-python/sphinx-gallery \
# 	dev-python/sphinx-prompt \
# 	dev-python/scikit-image

python_test() {
	local EPYTEST_DESELECT=(
		# TODO: floating-point problems
		gaussian_process/kernels.py::sklearn.gaussian_process.kernels.ExpSineSquared
		# doctest failing on extra shape= in repr, probably numpy version
		cluster/_hdbscan/hdbscan.py::sklearn.cluster._hdbscan.hdbscan.HDBSCAN
	)

	rm -rf sklearn || die
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest --pyargs sklearn
}

python_install_all() {
	find "${S}" -name \*LICENSE.txt -delete || die
	distutils-r1_python_install_all
	use examples && dodoc -r examples
}
