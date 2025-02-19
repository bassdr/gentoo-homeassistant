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
GENERATED_IUSE="benchmark docs examples install maintenance test"
IUSE="${GENERATED_IUSE} examples +build"

DEPEND="
	virtual/blas:=
	virtual/cblas:=
	>=dev-python/numpy-1.19.5:=[${PYTHON_USEDEP}]
"
REQUIRES_DIST="
	Pillow>=7.1.2; extra == 'docs'
	black>=24.3.0; extra == 'tests'
	conda-lock==2.5.6; extra == 'maintenance'
	cython>=3.0.10; extra == 'build'
	joblib>=1.2.0
	joblib>=1.2.0; extra == 'install'
	matplotlib>=3.3.4; extra == 'benchmark'
	matplotlib>=3.3.4; extra == 'docs'
	matplotlib>=3.3.4; extra == 'examples'
	matplotlib>=3.3.4; extra == 'tests'
	memory_profiler>=0.57.0; extra == 'benchmark'
	memory_profiler>=0.57.0; extra == 'docs'
	meson-python>=0.16.0; extra == 'build'
	mypy>=1.9; extra == 'tests'
	numpy>=1.19.5
	numpy>=1.19.5; extra == 'build'
	numpy>=1.19.5; extra == 'install'
	numpydoc>=1.2.0; extra == 'docs'
	numpydoc>=1.2.0; extra == 'tests'
	pandas>=1.1.5; extra == 'benchmark'
	pandas>=1.1.5; extra == 'docs'
	pandas>=1.1.5; extra == 'examples'
	pandas>=1.1.5; extra == 'tests'
	plotly>=5.14.0; extra == 'docs'
	plotly>=5.14.0; extra == 'examples'
	polars>=0.20.30; extra == 'docs'
	polars>=0.20.30; extra == 'tests'
	pooch>=1.6.0; extra == 'docs'
	pooch>=1.6.0; extra == 'examples'
	pooch>=1.6.0; extra == 'tests'
	pyamg>=4.0.0; extra == 'tests'
	pyarrow>=12.0.0; extra == 'tests'
	pydata-sphinx-theme>=0.15.3; extra == 'docs'
	pytest-cov>=2.9.0; extra == 'tests'
	pytest>=7.1.2; extra == 'tests'
	ruff>=0.5.1; extra == 'tests'
	scikit-image>=0.17.2; extra == 'docs'
	scikit-image>=0.17.2; extra == 'examples'
	scikit-image>=0.17.2; extra == 'tests'
	scipy>=1.6.0
	scipy>=1.6.0; extra == 'build'
	scipy>=1.6.0; extra == 'install'
	seaborn>=0.9.0; extra == 'docs'
	seaborn>=0.9.0; extra == 'examples'
	sphinx-copybutton>=0.5.2; extra == 'docs'
	sphinx-design>=0.5.0; extra == 'docs'
	sphinx-design>=0.6.0; extra == 'docs'
	sphinx-gallery>=0.17.1; extra == 'docs'
	sphinx-prompt>=1.4.0; extra == 'docs'
	sphinx-remove-toctrees>=1.0.0.post1; extra == 'docs'
	sphinx>=7.3.7; extra == 'docs'
	sphinxcontrib-sass>=0.3.4; extra == 'docs'
	sphinxext-opengraph>=0.9.1; extra == 'docs'
	threadpoolctl>=3.1.0
	threadpoolctl>=3.1.0; extra == 'install'
	towncrier>=24.8.0; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	maintenance? ( ~dev-python/conda-lock-2.5.6[${PYTHON_USEDEP}] )
	>=dev-python/joblib-1.2.0[${PYTHON_USEDEP}]
	install? ( >=dev-python/joblib-1.2.0[${PYTHON_USEDEP}] )
	benchmark? ( >=dev-python/matplotlib-3.3.4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/matplotlib-3.3.4[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/matplotlib-3.3.4[${PYTHON_USEDEP}] )
	benchmark? ( >=dev-python/memory-profiler-0.57.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/memory-profiler-0.57.0[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.19.5[${PYTHON_USEDEP}]
	install? ( >=dev-python/numpy-1.19.5[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/numpydoc-1.2.0[${PYTHON_USEDEP}] )
	benchmark? ( >=dev-python/pandas-1.1.5[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pandas-1.1.5[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/pandas-1.1.5[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pillow-7.1.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/plotly-5.14.0[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/plotly-5.14.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/polars-0.20.30[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pooch-1.6.0[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/pooch-1.6.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pydata-sphinx-theme-0.15.3[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/scikit-image-0.17.2[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/scikit-image-0.17.2[${PYTHON_USEDEP}] )
	>=dev-python/scipy-1.6.0[${PYTHON_USEDEP}]
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
RDEPEND="${GENERATED_RDEPEND}
	${DEPEND}
	>=dev-python/joblib-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/threadpoolctl-3.1.0[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	>=dev-python/cython-3.0.10[${PYTHON_USEDEP}]
	>=dev-python/meson-python-0.16.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.19.5[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.6.0[${PYTHON_USEDEP}]
	test? (
		>=dev-python/black-24.3.0[${PYTHON_USEDEP}]
		>=dev-python/matplotlib-3.3.4[${PYTHON_USEDEP}]
		>=dev-python/mypy-1.9[${PYTHON_USEDEP}]
		>=dev-python/numpydoc-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/pandas-1.1.5[${PYTHON_USEDEP}]
		>=dev-python/polars-0.20.30[${PYTHON_USEDEP}]
		>=dev-python/pooch-1.6.0[${PYTHON_USEDEP}]
		>=dev-python/pyamg-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/pyarrow-12.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.1.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-2.9.0[${PYTHON_USEDEP}]
		>=dev-python/ruff-0.5.1[${PYTHON_USEDEP}]
		>=dev-python/scikit-image-0.17.2[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
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
