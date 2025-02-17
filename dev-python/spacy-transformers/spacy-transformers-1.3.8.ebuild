# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="cuda cuda100 cuda101 cuda102 cuda110 cuda111 cuda112 cuda80 cuda90 cuda91 cuda92"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/spacy-transformers/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	cupy-cuda100>=5.0.0b4; extra == 'cuda100'
	cupy-cuda101>=5.0.0b4; extra == 'cuda101'
	cupy-cuda102>=5.0.0b4; extra == 'cuda102'
	cupy-cuda110>=5.0.0b4; extra == 'cuda110'
	cupy-cuda111>=5.0.0b4; extra == 'cuda111'
	cupy-cuda112>=5.0.0b4; extra == 'cuda112'
	cupy-cuda80>=5.0.0b4; extra == 'cuda80'
	cupy-cuda90>=5.0.0b4; extra == 'cuda90'
	cupy-cuda91>=5.0.0b4; extra == 'cuda91'
	cupy-cuda92>=5.0.0b4; extra == 'cuda92'
	cupy>=5.0.0b4; extra == 'cuda'
	dataclasses<1.0,>=0.6; python_version < '3.7'
	numpy>=1.15.0; python_version < '3.9'
	numpy>=1.19.0; python_version >= '3.9'
	spacy-alignments<1.0.0,>=0.7.2
	spacy<4.1.0,>=3.5.0
	srsly<3.0.0,>=2.4.0
	torch>=1.8.0
	transformers<4.50.0,>=3.4.0
"
GENERATED_RDEPEND="${RDEPEND}
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
	>=dev-python/numpy-1.19.0[${PYTHON_USEDEP}]
	>=dev-python/spacy-3.5.0[${PYTHON_USEDEP}] <dev-python/spacy-4.1.0[${PYTHON_USEDEP}]
	>=dev-python/spacy-alignments-0.7.2[${PYTHON_USEDEP}] <dev-python/spacy-alignments-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/srsly-2.4.0[${PYTHON_USEDEP}] <dev-python/srsly-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/torch-1.8.0[${PYTHON_USEDEP}]
	>=dev-python/transformers-3.4.0[${PYTHON_USEDEP}] <dev-python/transformers-4.50.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
