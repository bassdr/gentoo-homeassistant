# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/seaborn/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs stats"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	flake8 ; extra == "dev"
	flit ; extra == "dev"
	ipykernel ; extra == "docs"
	matplotlib>=3.4,!=3.6.1
	mypy ; extra == "dev"
	nbconvert ; extra == "docs"
	numpy>=1.20,!=1.24.0
	numpydoc ; extra == "docs"
	pandas-stubs ; extra == "dev"
	pandas>=1.2
	pre-commit ; extra == "dev"
	pydata_sphinx_theme==0.10.0rc2 ; extra == "docs"
	pytest ; extra == "dev"
	pytest-cov ; extra == "dev"
	pytest-xdist ; extra == "dev"
	pyyaml ; extra == "docs"
	scipy>=1.7 ; extra == "stats"
	sphinx-copybutton ; extra == "docs"
	sphinx-design ; extra == "docs"
	sphinx-issues ; extra == "docs"
	sphinx<6.0.0 ; extra == "docs"
	statsmodels>=0.12 ; extra == "stats"
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	>=dev-python/matplotlib-3.4[${PYTHON_USEDEP}] !~dev-python/matplotlib-3.6.1[${PYTHON_USEDEP}]
	docs? ( dev-python/nbconvert[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.20[${PYTHON_USEDEP}] !~dev-python/numpy-1.24.0[${PYTHON_USEDEP}]
	docs? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	>=dev-python/pandas-1.2[${PYTHON_USEDEP}]
	docs? ( ~dev-python/pydata-sphinx-theme-0.10.0_rc2[${PYTHON_USEDEP}] )
	docs? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
	stats? ( >=dev-python/scipy-1.7[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-6.0.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-issues[${PYTHON_USEDEP}] )
	stats? ( >=dev-python/statsmodels-0.12[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/matplotlib-3.4[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.20[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.2[${PYTHON_USEDEP}]
	>=dev-python/statsmodels-0.12[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.7[${PYTHON_USEDEP}]
"

EPYTEST_XDIST=1
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/flit[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/pandas-stubs[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_prepare() {
	distutils-r1_src_prepare

	# https://github.com/mwaskom/seaborn/pull/3685
	sed -i -e '/VisibleDeprecationWarning/d' tests/test_distributions.py || die
}

src_test() {
	cat > matplotlibrc <<- EOF || die
		backend : Agg
	EOF

	distutils-r1_src_test
}
