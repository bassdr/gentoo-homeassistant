# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all build doc extra lint typing"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/plotnine/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	extra? ( >=dev-python/adjusttext-1.2.0[${PYTHON_USEDEP}] )
	build? ( dev-python/build[${PYTHON_USEDEP}] )
	doc? ( dev-python/click[${PYTHON_USEDEP}] )
	extra? ( >=dev-python/geopandas-1.0.0[${PYTHON_USEDEP}] )
	typing? ( dev-python/ipython[${PYTHON_USEDEP}] )
	doc? ( dev-python/jupyter[${PYTHON_USEDEP}] )
	>=dev-python/matplotlib-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/mizani-0.13.0[${PYTHON_USEDEP}] =dev-python/mizani-0.13*[${PYTHON_USEDEP}]
	doc? ( dev-python/nbsphinx[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.23.5[${PYTHON_USEDEP}]
	doc? ( >=dev-python/numpydoc-0.9.1[${PYTHON_USEDEP}] )
	>=dev-python/pandas-2.2.0[${PYTHON_USEDEP}]
	typing? ( dev-python/pandas-stubs[${PYTHON_USEDEP}] )
	all? ( dev-python/plotnine[build,${PYTHON_USEDEP}] )
	all? ( dev-python/plotnine[dev,${PYTHON_USEDEP}] )
	all? ( dev-python/plotnine[doc,${PYTHON_USEDEP}] )
	all? ( dev-python/plotnine[extra,${PYTHON_USEDEP}] )
	all? ( dev-python/plotnine[lint,${PYTHON_USEDEP}] )
	all? ( dev-python/plotnine[test,${PYTHON_USEDEP}] )
	typing? ( =dev-python/pyright-1.1.391[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/quartodoc-0.7.2[${PYTHON_USEDEP}] )
	lint? ( dev-python/ruff[${PYTHON_USEDEP}] )
	extra? ( >dev-python/scikit-learn-1.2.0[${PYTHON_USEDEP}] )
	extra? ( >=dev-python/scikit-misc-0.5.1[${PYTHON_USEDEP}] )
	>=dev-python/scipy-1.8.0[${PYTHON_USEDEP}]
	>=dev-python/statsmodels-0.14.0[${PYTHON_USEDEP}]
	build? ( dev-python/wheel[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/plotnine[typing,${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}]
		dev-python/twine[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
