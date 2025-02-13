# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="examples ogb_examples"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

SRC_URI="$(pypi_sdist_url --no-normalize "jraph" "0.0.6.dev0")"
S="${WORKDIR}/jraph-0.0.6.dev0"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jraph/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	examples? ( >=dev-python/absl-py-0.9[${PYTHON_USEDEP}] )
	ogb_examples? ( >=dev-python/absl-py-0.9[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/dm-haiku-0.0.2[${PYTHON_USEDEP}] )
	ogb_examples? ( >=dev-python/dm-haiku-0.0.2[${PYTHON_USEDEP}] )
	ogb_examples? ( >=dev-python/dm-tree-0.1.5[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/frozendict-2.0.2[${PYTHON_USEDEP}] )
	>=dev-python/jax-0.1.55[${PYTHON_USEDEP}]
	>=dev-python/jaxlib-0.1.37[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.18.0[${PYTHON_USEDEP}]
	examples? ( >=dev-python/optax-0.0.1[${PYTHON_USEDEP}] )
	ogb_examples? ( >=dev-python/optax-0.0.1[${PYTHON_USEDEP}] )
	ogb_examples? ( >=dev-python/pandas-1.0.5[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/scipy-1.2.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
