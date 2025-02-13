# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="flags"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fiddle/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/absl-py[${PYTHON_USEDEP}]
	flags? ( dev-python/absl-py[${PYTHON_USEDEP}] )
	flags? ( dev-python/etils[epath,${PYTHON_USEDEP}] )
	dev-python/graphviz[${PYTHON_USEDEP}]
	dev-python/libcst[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/cloudpickle[${PYTHON_USEDEP}]
	dev-python/fiddle[flags,${PYTHON_USEDEP}]
	dev-python/flax[${PYTHON_USEDEP}]
	dev-python/graphviz[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytype[${PYTHON_USEDEP}]
	dev-python/seqio[${PYTHON_USEDEP}]
	>=dev-python/tfds-nightly-4.9.2_pre202308090034[${PYTHON_USEDEP}]
)"
