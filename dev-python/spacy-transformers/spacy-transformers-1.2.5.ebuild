# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="cuda cuda100 cuda101 cuda102 cuda110 cuda111 cuda112 cuda80 cuda90 cuda91 cuda92"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/spacy-transformers/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	cuda? ( >=dev-python/cupy-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda100? ( >=dev-python/cupy-cuda100-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda101? ( >=dev-python/cupy-cuda101-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda102? ( >=dev-python/cupy-cuda102-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda110? ( >=dev-python/cupy-cuda110-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda111? ( >=dev-python/cupy-cuda111-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda112? ( >=dev-python/cupy-cuda112-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda80? ( >=dev-python/cupy-cuda80-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda90? ( >=dev-python/cupy-cuda90-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda91? ( >=dev-python/cupy-cuda91-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda92? ( >=dev-python/cupy-cuda92-5.0.0_beta4[${PYTHON_USEDEP}] )
	<dev-python/dataclasses-1.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.15.0[${PYTHON_USEDEP}]
	<dev-python/spacy-4.0.0[${PYTHON_USEDEP}]
	<dev-python/spacy-alignments-1.0.0[${PYTHON_USEDEP}]
	<dev-python/srsly-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/torch-1.8.0[${PYTHON_USEDEP}]
	<dev-python/transformers-4.31.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest