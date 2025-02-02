# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="quality"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/optimum-graphcore/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	quality? ( ~dev-python/black-23.1[${PYTHON_USEDEP}] )
	~dev-python/cppimport-22.8.2[${PYTHON_USEDEP}]
	dev-python/datasets[${PYTHON_USEDEP}]
	~dev-python/diffusers-0.12.1[torch,${PYTHON_USEDEP}]
	quality? ( >=dev-python/isort-5.5.4[${PYTHON_USEDEP}] )
	~dev-python/optimum-1.6.1[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	quality? ( <=dev-python/ruff-0.0.259[${PYTHON_USEDEP}] )
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/sentencepiece[${PYTHON_USEDEP}]
	~dev-python/transformers-4.29.2[${PYTHON_USEDEP}]
	dev-python/typeguard[${PYTHON_USEDEP}]
	sci-libs/tokenizers[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/filelock[${PYTHON_USEDEP}]
	dev-python/gitpython[${PYTHON_USEDEP}]
	dev-python/librosa[${PYTHON_USEDEP}]
	dev-python/parameterized[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-pythonpath[${PYTHON_USEDEP}]
	dev-python/pytest-xdist[${PYTHON_USEDEP}]
	dev-python/soundfile[${PYTHON_USEDEP}]
)"
