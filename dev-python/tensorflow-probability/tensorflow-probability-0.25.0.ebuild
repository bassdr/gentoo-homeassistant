# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="jax tf tfds"
IUSE="${GENERATED_IUSE}"

PYPI_PN="tensorflow_probability"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tensorflow_probability/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/absl-py[${PYTHON_USEDEP}]
	>=dev-python/cloudpickle-1.3[${PYTHON_USEDEP}]
	dev-python/decorator[${PYTHON_USEDEP}]
	dev-python/dm-tree[${PYTHON_USEDEP}]
	>=dev-python/gast-0.3.2[${PYTHON_USEDEP}]
	jax? ( dev-python/jax[${PYTHON_USEDEP}] )
	jax? ( dev-python/jaxlib[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.13.3[${PYTHON_USEDEP}]
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
	tf? ( >=dev-python/tensorflow-2.16[${PYTHON_USEDEP}] )
	tfds? ( >=dev-python/tensorflow-datasets-2.2.0[${PYTHON_USEDEP}] )
	tf? ( >=dev-python/tf-keras-2.16[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest