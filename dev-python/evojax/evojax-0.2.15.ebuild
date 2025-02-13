# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="extra"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/evojax/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	extra? ( dev-python/brax[${PYTHON_USEDEP}] )
	dev-python/cma[${PYTHON_USEDEP}]
	extra? ( dev-python/evosax[${PYTHON_USEDEP}] )
	dev-python/flax[${PYTHON_USEDEP}]
	>=dev-python/jax-0.2.17[${PYTHON_USEDEP}]
	>=dev-python/jaxlib-0.1.65[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	extra? ( dev-python/pandas[${PYTHON_USEDEP}] )
	dev-python/pillow[${PYTHON_USEDEP}]
	extra? ( dev-python/procgen[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	extra? ( dev-python/torchvision[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
