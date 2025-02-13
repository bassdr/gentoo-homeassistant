# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="dev doc plots"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/scikit-optimize/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev? ( dev-python/flake8[${PYTHON_USEDEP}] )
	>=dev-python/joblib-0.11[${PYTHON_USEDEP}]
	plots? ( >=dev-python/matplotlib-2.0.0[${PYTHON_USEDEP}] )
	doc? ( dev-python/memory-profiler[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.20.3[${PYTHON_USEDEP}]
	doc? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	>=dev-python/packaging-21.3[${PYTHON_USEDEP}]
	dev? ( dev-python/pandas[${PYTHON_USEDEP}] )
	>=dev-python/pyaml-16.9[${PYTHON_USEDEP}]
	doc? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	>=dev-python/scikit-learn-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.1.0[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-gallery-0.6[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest