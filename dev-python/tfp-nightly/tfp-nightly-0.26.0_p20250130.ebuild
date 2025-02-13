# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="jax tf tfds"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

SRC_URI="$(pypi_sdist_url --no-normalize "tfp-nightly" "0.26.0.dev20250130")"
S="${WORKDIR}/tfp-nightly-0.26.0.dev20250130"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tfp-nightly/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/absl-py[${PYTHON_USEDEP}]
	>=dev-python/cloudpickle-1.3[${PYTHON_USEDEP}]
	dev-python/decorator[${PYTHON_USEDEP}]
	dev-python/dm-tree[${PYTHON_USEDEP}]
	>=dev-python/gast-0.3.2[${PYTHON_USEDEP}]
	jax? ( dev-python/jax[${PYTHON_USEDEP}] )
	jax? ( dev-python/jaxlib[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.13.3[${PYTHON_USEDEP}]
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
	tf? ( dev-python/tf-keras-nightly[${PYTHON_USEDEP}] )
	tf? ( dev-python/tf-nightly[${PYTHON_USEDEP}] )
	tfds? ( dev-python/tfds-nightly[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
