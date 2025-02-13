# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/clu/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/absl-py[${PYTHON_USEDEP}]
	dev-python/etils[epath,${PYTHON_USEDEP}]
	dev-python/flax[${PYTHON_USEDEP}]
	dev-python/jax[${PYTHON_USEDEP}]
	dev-python/jaxlib[${PYTHON_USEDEP}]
	dev-python/ml-collections[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/wrapt[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/tensorflow[${PYTHON_USEDEP}]
	dev-python/tensorflow-datasets[${PYTHON_USEDEP}]
	>=dev-python/torch-2.0.0[${PYTHON_USEDEP}]
)"
