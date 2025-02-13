# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/chex/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/absl-py-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/jax-0.4.27[${PYTHON_USEDEP}]
	>=dev-python/jaxlib-0.4.27[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.24.1[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/setuptools[${PYTHON_USEDEP}]' python3_13{,t})
	>=dev-python/toolz-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
