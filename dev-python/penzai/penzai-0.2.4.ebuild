# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs extras notebook"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/penzai/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/absl-py-1.4.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/flax-0.8.2[${PYTHON_USEDEP}] )
	extras? ( >=dev-python/flax-0.8.2[${PYTHON_USEDEP}] )
	notebook? ( >=dev-python/flax-0.8.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/ipython-8.8.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/ipython[${PYTHON_USEDEP}] )
	extras? ( dev-python/ipython[${PYTHON_USEDEP}] )
	notebook? ( dev-python/ipython[${PYTHON_USEDEP}] )
	>=dev-python/jax-0.4.23[${PYTHON_USEDEP}]
	docs? ( >=dev-python/jax-0.4.23[cpu,${PYTHON_USEDEP}] )
	docs? ( >=dev-python/matplotlib-3.5.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/myst-nb-1.0.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/myst-parser-3.0.1[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.25.2[${PYTHON_USEDEP}]
	docs? ( dev-python/optax[${PYTHON_USEDEP}] )
	extras? ( dev-python/optax[${PYTHON_USEDEP}] )
	notebook? ( dev-python/optax[${PYTHON_USEDEP}] )
	notebook? ( dev-python/orbax-checkpoint[${PYTHON_USEDEP}] )
	>=dev-python/ordered-set-4.1.0[${PYTHON_USEDEP}]
	docs? ( ~dev-python/packaging-24.1[${PYTHON_USEDEP}] )
	notebook? ( dev-python/palettable[${PYTHON_USEDEP}] )
	docs? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-7.3.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-book-theme-1.0.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-collections-0.0.1[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-contributors[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-hoverxref[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-katex[${PYTHON_USEDEP}] )
	extras? ( dev-python/torch[${PYTHON_USEDEP}] )
	extras? ( >=dev-python/transformers-4.41.2[${PYTHON_USEDEP}] )
	>=dev-python/treescope-0.1.3[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/ipython[${PYTHON_USEDEP}]
	dev-python/jupyter[${PYTHON_USEDEP}]
	>=dev-python/pyink-24.3.0[${PYTHON_USEDEP}]
	>=dev-python/pylint-2.6.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-8.2.2[${PYTHON_USEDEP}]
	dev-python/pytype[${PYTHON_USEDEP}]
)"
