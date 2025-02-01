# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="full"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pykeops/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	full? ( dev-python/breathe[${PYTHON_USEDEP}] )
	full? ( dev-python/faiss[${PYTHON_USEDEP}] )
	full? ( dev-python/gpytorch[${PYTHON_USEDEP}] )
	full? ( dev-python/h5py[${PYTHON_USEDEP}] )
	full? ( dev-python/imageio[${PYTHON_USEDEP}] )
	full? ( dev-python/jax[${PYTHON_USEDEP}] )
	full? ( dev-python/jaxlib[${PYTHON_USEDEP}] )
	~dev-python/keopscore-2.2.3[${PYTHON_USEDEP}]
	full? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	full? ( dev-python/multiprocess[${PYTHON_USEDEP}] )
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pybind11[${PYTHON_USEDEP}]
	full? ( dev-python/recommonmark[${PYTHON_USEDEP}] )
	full? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	full? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	full? ( dev-python/sphinx-gallery[${PYTHON_USEDEP}] )
	full? ( dev-python/sphinx-prompt[${PYTHON_USEDEP}] )
	full? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	full? ( dev-python/sphinxcontrib-httpdomain[${PYTHON_USEDEP}] )
	full? ( dev-python/torch[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/torch[${PYTHON_USEDEP}]
)"
