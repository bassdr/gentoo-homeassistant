# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pylibcudf-cu12/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/cuda-python-13.0_alpha0[${PYTHON_USEDEP}]
	~dev-python/libcudf-cu12-24.12[${PYTHON_USEDEP}]
	>=dev-python/nvtx-0.2.1[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	<dev-python/pyarrow-19.0.0_alpha0[${PYTHON_USEDEP}]
	!=dev-python/pyarrow-17.0.0[${PYTHON_USEDEP}]
	~dev-python/rmm-cu12-24.12[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/fastavro-0.22.9[${PYTHON_USEDEP}]
	dev-python/hypothesis[${PYTHON_USEDEP}]
	<dev-python/numpy-3.0_alpha0[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	<dev-python/pytest-8[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/pytest-xdist[${PYTHON_USEDEP}]
)"
