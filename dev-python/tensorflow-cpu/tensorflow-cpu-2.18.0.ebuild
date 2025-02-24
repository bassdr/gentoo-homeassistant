# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="and-cuda"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tensorflow-cpu/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	absl-py>=1.0.0
	astunparse>=1.6.0
	flatbuffers>=24.3.25
	gast!=0.5.0,!=0.5.1,!=0.5.2,>=0.2.1
	google-pasta>=0.1.1
	grpcio<2.0,>=1.24.3
	h5py>=3.11.0
	keras>=3.5.0
	libclang>=13.0.0
	ml-dtypes<0.5.0,>=0.4.0
	numpy<2.1.0,>=1.26.0
	nvidia-cublas-cu12==12.5.3.2; extra == 'and-cuda'
	nvidia-cuda-cupti-cu12==12.5.82; extra == 'and-cuda'
	nvidia-cuda-nvcc-cu12==12.5.82; extra == 'and-cuda'
	nvidia-cuda-nvrtc-cu12==12.5.82; extra == 'and-cuda'
	nvidia-cuda-runtime-cu12==12.5.82; extra == 'and-cuda'
	nvidia-cudnn-cu12==9.3.0.75; extra == 'and-cuda'
	nvidia-cufft-cu12==11.2.3.61; extra == 'and-cuda'
	nvidia-curand-cu12==10.3.6.82; extra == 'and-cuda'
	nvidia-cusolver-cu12==11.6.3.83; extra == 'and-cuda'
	nvidia-cusparse-cu12==12.5.1.3; extra == 'and-cuda'
	nvidia-nccl-cu12==2.21.5; extra == 'and-cuda'
	nvidia-nvjitlink-cu12==12.5.82; extra == 'and-cuda'
	opt-einsum>=2.3.2
	packaging
	protobuf!=4.21.0,!=4.21.1,!=4.21.2,!=4.21.3,!=4.21.4,!=4.21.5,<6.0.0dev,>=3.20.3
	requests<3,>=2.21.0
	setuptools
	six>=1.12.0
	tensorboard<2.19,>=2.18
	tensorflow-intel==2.18.0; platform_system == 'Windows'
	tensorflow-io-gcs-filesystem>=0.23.1; python_version < '3.12'
	termcolor>=1.1.0
	typing-extensions>=3.6.6
	wrapt>=1.11.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/absl-py-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/astunparse-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/flatbuffers-24.3.25[${PYTHON_USEDEP}]
	>=dev-python/gast-0.2.1[${PYTHON_USEDEP}] !~dev-python/gast-0.5.0[${PYTHON_USEDEP}] !~dev-python/gast-0.5.1[${PYTHON_USEDEP}] !~dev-python/gast-0.5.2[${PYTHON_USEDEP}]
	>=dev-python/google-pasta-0.1.1[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.24.3[${PYTHON_USEDEP}] <dev-python/grpcio-2.0[${PYTHON_USEDEP}]
	>=dev-python/h5py-3.11.0[${PYTHON_USEDEP}]
	>=dev-python/keras-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/libclang-13.0.0[${PYTHON_USEDEP}]
	>=dev-python/ml-dtypes-0.4.0[${PYTHON_USEDEP}] <dev-python/ml-dtypes-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}] <dev-python/numpy-2.1.0[${PYTHON_USEDEP}]
	and-cuda? ( ~dev-python/nvidia-cublas-cu12-12.5.3.2[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-cuda-cupti-cu12-12.5.82[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-cuda-nvcc-cu12-12.5.82[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-cuda-nvrtc-cu12-12.5.82[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-cuda-runtime-cu12-12.5.82[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-cudnn-cu12-9.3.0.75[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-cufft-cu12-11.2.3.61[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-curand-cu12-10.3.6.82[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-cusolver-cu12-11.6.3.83[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-cusparse-cu12-12.5.1.3[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-nccl-cu12-2.21.5[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-nvjitlink-cu12-12.5.82[${PYTHON_USEDEP}] )
	>=dev-python/opt-einsum-2.3.2[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.20.3[${PYTHON_USEDEP}] <dev-python/protobuf-6.0.0_pre[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.0[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.1[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.2[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.3[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.4[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.5[${PYTHON_USEDEP}]
	>=dev-python/requests-2.21.0[${PYTHON_USEDEP}] <dev-python/requests-3[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/six-1.12.0[${PYTHON_USEDEP}]
	>=dev-python/tensorboard-2.18[${PYTHON_USEDEP}] <dev-python/tensorboard-2.19[${PYTHON_USEDEP}]
	>=dev-python/termcolor-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.6.6[${PYTHON_USEDEP}]
	>=dev-python/wrapt-1.11.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
