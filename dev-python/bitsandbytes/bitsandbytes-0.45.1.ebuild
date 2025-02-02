# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="benchmark docs"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1
SRC_URI="https://github.com/bitsandbytes-foundation/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/bitsandbytes/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	docs? ( ~dev-python/hf-doc-builder-0.5.0[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.17[${PYTHON_USEDEP}]
	benchmark? ( dev-python/pandas[${PYTHON_USEDEP}] )
	<dev-python/scipy-2[${PYTHON_USEDEP}]
	~dev-python/torch-2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/bitsandbytes[test,${PYTHON_USEDEP}]
	<dev-python/build-2[${PYTHON_USEDEP}]
	~dev-python/einops-0.8.0[${PYTHON_USEDEP}]
	~dev-python/lion-pytorch-0.2.3[${PYTHON_USEDEP}]
	~dev-python/pytest-8.3[${PYTHON_USEDEP}]
	~dev-python/ruff-0.6.9[${PYTHON_USEDEP}]
	<dev-python/transformers-5[${PYTHON_USEDEP}]
	<dev-python/wheel-1[${PYTHON_USEDEP}]
	<dev-vcs/pre-commit-4[${PYTHON_USEDEP}]
)"
