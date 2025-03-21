# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="cuda cuda-autodetect cuda100 cuda101 cuda102 cuda110 cuda111 cuda112 cuda113 cuda114 cuda115 cuda116 cuda117 cuda11x cuda12x cuda80 cuda90 cuda91 cuda92 datasets mxnet tensorflow torch"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/thinc/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	blis<1.1.0,>=1.0.0
	catalogue<2.1.0,>=2.0.4
	confection<1.0.0,>=0.0.1
	cupy-cuda100>=5.0.0b4; extra == 'cuda100'
	cupy-cuda101>=5.0.0b4; extra == 'cuda101'
	cupy-cuda102>=5.0.0b4; extra == 'cuda102'
	cupy-cuda110>=5.0.0b4; extra == 'cuda110'
	cupy-cuda111>=5.0.0b4; extra == 'cuda111'
	cupy-cuda112>=5.0.0b4; extra == 'cuda112'
	cupy-cuda113>=5.0.0b4; extra == 'cuda113'
	cupy-cuda114>=5.0.0b4; extra == 'cuda114'
	cupy-cuda115>=5.0.0b4; extra == 'cuda115'
	cupy-cuda116>=5.0.0b4; extra == 'cuda116'
	cupy-cuda117>=5.0.0b4; extra == 'cuda117'
	cupy-cuda11x>=11.0.0; extra == 'cuda11x'
	cupy-cuda12x>=11.5.0; extra == 'cuda12x'
	cupy-cuda80>=5.0.0b4; extra == 'cuda80'
	cupy-cuda90>=5.0.0b4; extra == 'cuda90'
	cupy-cuda91>=5.0.0b4; extra == 'cuda91'
	cupy-cuda92>=5.0.0b4; extra == 'cuda92'
	cupy-wheel>=11.0.0; extra == 'cuda-autodetect'
	cupy>=5.0.0b4; extra == 'cuda'
	cymem<2.1.0,>=2.0.2
	ml-datasets<0.3.0,>=0.2.0; extra == 'datasets'
	murmurhash<1.1.0,>=1.0.2
	mxnet<1.6.0,>=1.5.1; extra == 'mxnet'
	numpy<3.0.0,>=2.0.0
	packaging>=20.0
	preshed<3.1.0,>=3.0.2
	pydantic!=1.8,!=1.8.1,<3.0.0,>=1.7.4
	setuptools
	srsly<3.0.0,>=2.4.0
	tensorflow<2.6.0,>=2.0.0; extra == 'tensorflow'
	torch>=1.6.0; extra == 'torch'
	wasabi<1.2.0,>=0.8.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/blis-1.0.0[${PYTHON_USEDEP}] <dev-python/blis-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/catalogue-2.0.4[${PYTHON_USEDEP}] <dev-python/catalogue-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/confection-0.0.1[${PYTHON_USEDEP}] <dev-python/confection-1.0.0[${PYTHON_USEDEP}]
	cuda? ( >=dev-python/cupy-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda100? ( >=dev-python/cupy-cuda100-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda101? ( >=dev-python/cupy-cuda101-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda102? ( >=dev-python/cupy-cuda102-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda110? ( >=dev-python/cupy-cuda110-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda111? ( >=dev-python/cupy-cuda111-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda112? ( >=dev-python/cupy-cuda112-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda113? ( >=dev-python/cupy-cuda113-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda114? ( >=dev-python/cupy-cuda114-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda115? ( >=dev-python/cupy-cuda115-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda116? ( >=dev-python/cupy-cuda116-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda117? ( >=dev-python/cupy-cuda117-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda11x? ( >=dev-python/cupy-cuda11x-11.0.0[${PYTHON_USEDEP}] )
	cuda12x? ( >=dev-python/cupy-cuda12x-11.5.0[${PYTHON_USEDEP}] )
	cuda80? ( >=dev-python/cupy-cuda80-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda90? ( >=dev-python/cupy-cuda90-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda91? ( >=dev-python/cupy-cuda91-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda92? ( >=dev-python/cupy-cuda92-5.0.0_beta4[${PYTHON_USEDEP}] )
	cuda-autodetect? ( >=dev-python/cupy-wheel-11.0.0[${PYTHON_USEDEP}] )
	>=dev-python/cymem-2.0.2[${PYTHON_USEDEP}] <dev-python/cymem-2.1.0[${PYTHON_USEDEP}]
	datasets? ( >=dev-python/ml-datasets-0.2.0[${PYTHON_USEDEP}] <dev-python/ml-datasets-0.3.0[${PYTHON_USEDEP}] )
	>=dev-python/murmurhash-1.0.2[${PYTHON_USEDEP}] <dev-python/murmurhash-1.1.0[${PYTHON_USEDEP}]
	mxnet? ( >=dev-python/mxnet-1.5.1[${PYTHON_USEDEP}] <dev-python/mxnet-1.6.0[${PYTHON_USEDEP}] )
	>=dev-python/numpy-2.0.0[${PYTHON_USEDEP}] <dev-python/numpy-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	>=dev-python/preshed-3.0.2[${PYTHON_USEDEP}] <dev-python/preshed-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.7.4[${PYTHON_USEDEP}] <dev-python/pydantic-3.0.0[${PYTHON_USEDEP}] !~dev-python/pydantic-1.8[${PYTHON_USEDEP}] !~dev-python/pydantic-1.8.1[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/srsly-2.4.0[${PYTHON_USEDEP}] <dev-python/srsly-3.0.0[${PYTHON_USEDEP}]
	tensorflow? ( >=dev-python/tensorflow-2.0.0[${PYTHON_USEDEP}] <dev-python/tensorflow-2.6.0[${PYTHON_USEDEP}] )
	torch? ( >=dev-python/torch-1.6.0[${PYTHON_USEDEP}] )
	>=dev-python/wasabi-0.8.1[${PYTHON_USEDEP}] <dev-python/wasabi-1.2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
