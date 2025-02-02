# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all quality release transformers"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/hf-doc-builder/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	all? ( ~dev-python/black-22.0[${PYTHON_USEDEP}] )
	quality? ( ~dev-python/black-22.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/flake8-3.8.3[${PYTHON_USEDEP}] )
	quality? ( >=dev-python/flake8-3.8.3[${PYTHON_USEDEP}] )
	dev-python/gitpython[${PYTHON_USEDEP}]
	all? ( dev-python/google-api-python-client[${PYTHON_USEDEP}] )
	dev-python/huggingface-hub[${PYTHON_USEDEP}]
	all? ( >=dev-python/isort-5.5.4[${PYTHON_USEDEP}] )
	quality? ( >=dev-python/isort-5.5.4[${PYTHON_USEDEP}] )
	dev-python/nbformat[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	all? ( dev-python/pytest[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	all? ( dev-python/requests[${PYTHON_USEDEP}] )
	all? ( dev-python/timm[${PYTHON_USEDEP}] )
	all? ( dev-python/torch[${PYTHON_USEDEP}] )
	dev-python/tqdm[${PYTHON_USEDEP}]
	all? ( dev-python/transformers[${PYTHON_USEDEP}] )
	transformers? ( dev-python/transformers[dev,${PYTHON_USEDEP}] )
	release? ( dev-python/twine[${PYTHON_USEDEP}] )
	all? ( sci-libs/tokenizers[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/black-22.0[${PYTHON_USEDEP}]
	>=dev-python/flake8-3.8.3[${PYTHON_USEDEP}]
	dev-python/google-api-python-client[${PYTHON_USEDEP}]
	>=dev-python/isort-5.5.4[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-xdist[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/timm[${PYTHON_USEDEP}]
	dev-python/torch[${PYTHON_USEDEP}]
	dev-python/transformers[${PYTHON_USEDEP}]
	sci-libs/tokenizers[${PYTHON_USEDEP}]
)"
