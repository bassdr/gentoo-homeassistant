# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="docs dp-accounting examples"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/optax/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/absl-py-0.7.1[${PYTHON_USEDEP}]
	dp-accounting? ( >=dev-python/absl-py-1.0.0[${PYTHON_USEDEP}] )
	dp-accounting? ( >=dev-python/attrs-21.4.0[${PYTHON_USEDEP}] )
	>=dev-python/chex-0.1.87[${PYTHON_USEDEP}]
	examples? ( >=dev-python/dp-accounting-0.4[${PYTHON_USEDEP}] )
	dev-python/etils[epy,${PYTHON_USEDEP}]
	docs? ( dev-python/flax[${PYTHON_USEDEP}] )
	examples? ( dev-python/flax[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/ipython-8.8.0[${PYTHON_USEDEP}] )
	examples? ( dev-python/ipywidgets[${PYTHON_USEDEP}] )
	>=dev-python/jax-0.4.27[${PYTHON_USEDEP}]
	>=dev-python/jaxlib-0.4.27[${PYTHON_USEDEP}]
	docs? ( >=dev-python/matplotlib-3.5.0[${PYTHON_USEDEP}] )
	dp-accounting? ( >=dev-python/mpmath-1.2.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/myst-nb-1.0.0[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.18.0[${PYTHON_USEDEP}]
	dp-accounting? ( >=dev-python/numpy-1.21.4[${PYTHON_USEDEP}] )
	dp-accounting? ( >=dev-python/scipy-1.7.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-6.0.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autodoc-typehints[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-book-theme-1.0.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-collections-0.0.1[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-contributors[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-gallery-0.14.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-katex[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/tensorflow-2.4.0[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/tensorflow-2.4.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/tensorflow-datasets-4.2.0[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/tensorflow-datasets-4.2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/dm-tree-0.1.7[${PYTHON_USEDEP}]
	>=dev-python/flax-0.5.3[${PYTHON_USEDEP}]
	dev-python/scikit-learn[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.7.1[${PYTHON_USEDEP}]
)"
