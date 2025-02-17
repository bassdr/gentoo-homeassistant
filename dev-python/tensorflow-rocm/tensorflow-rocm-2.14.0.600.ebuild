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
  https://pypi.org/project/tensorflow-rocm/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	absl-py (>=1.0.0)
	astunparse (>=1.6.0)
	flatbuffers (>=23.5.26)
	gast (!=0.5.0,!=0.5.1,!=0.5.2,>=0.2.1)
	google-pasta (>=0.1.1)
	grpcio (<2.0,>=1.24.3)
	h5py (>=2.9.0)
	keras (<2.15,>=2.14.0)
	libclang (>=13.0.0)
	ml-dtypes (==0.2.0)
	numpy (>=1.23.5)
	nvidia-cublas-cu11 (==11.11.3.6) ; extra == 'and-cuda'
	nvidia-cuda-cupti-cu11 (==11.8.87) ; extra == 'and-cuda'
	nvidia-cuda-nvcc-cu11 (==11.8.89) ; extra == 'and-cuda'
	nvidia-cuda-runtime-cu11 (==11.8.89) ; extra == 'and-cuda'
	nvidia-cudnn-cu11 (==8.7.0.84) ; extra == 'and-cuda'
	nvidia-cufft-cu11 (==10.9.0.58) ; extra == 'and-cuda'
	nvidia-curand-cu11 (==10.3.0.86) ; extra == 'and-cuda'
	nvidia-cusolver-cu11 (==11.4.1.48) ; extra == 'and-cuda'
	nvidia-cusparse-cu11 (==11.7.5.86) ; extra == 'and-cuda'
	nvidia-nccl-cu11 (==2.16.5) ; extra == 'and-cuda'
	opt-einsum (>=2.3.2)
	packaging
	protobuf (!=4.21.0,!=4.21.1,!=4.21.2,!=4.21.3,!=4.21.4,!=4.21.5,<5.0.0dev,>=3.20.3)
	setuptools
	six (>=1.12.0)
	tensorboard (<2.15,>=2.14)
	tensorflow-cpu-aws (==2.14.0.600) ; platform_system == 'Linux' and (platform_machine == 'arm64' or platform_machine == 'aarch64')
	tensorflow-estimator (<2.15,>=2.14.0)
	tensorflow-intel (==2.14.0.600) ; platform_system == 'Windows'
	tensorflow-io-gcs-filesystem (>=0.23.1)
	tensorrt (==8.5.3.1) ; extra == 'and-cuda'
	termcolor (>=1.1.0)
	typing-extensions (>=3.6.6)
	wrapt (<1.15,>=1.11.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/absl-py-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/astunparse-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/flatbuffers-23.5.26[${PYTHON_USEDEP}]
	>=dev-python/gast-0.2.1[${PYTHON_USEDEP}] !~dev-python/gast-0.5.0[${PYTHON_USEDEP}] !~dev-python/gast-0.5.1[${PYTHON_USEDEP}] !~dev-python/gast-0.5.2[${PYTHON_USEDEP}]
	>=dev-python/google-pasta-0.1.1[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.24.3[${PYTHON_USEDEP}] <dev-python/grpcio-2.0[${PYTHON_USEDEP}]
	>=dev-python/h5py-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/keras-2.14.0[${PYTHON_USEDEP}] <dev-python/keras-2.15[${PYTHON_USEDEP}]
	>=dev-python/libclang-13.0.0[${PYTHON_USEDEP}]
	~dev-python/ml-dtypes-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.23.5[${PYTHON_USEDEP}]
	and-cuda? ( ~dev-python/nvidia-cublas-cu11-11.11.3.6[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-cuda-cupti-cu11-11.8.87[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-cuda-nvcc-cu11-11.8.89[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-cuda-runtime-cu11-11.8.89[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-cudnn-cu11-8.7.0.84[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-cufft-cu11-10.9.0.58[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-curand-cu11-10.3.0.86[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-cusolver-cu11-11.4.1.48[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-cusparse-cu11-11.7.5.86[${PYTHON_USEDEP}] )
	and-cuda? ( ~dev-python/nvidia-nccl-cu11-2.16.5[${PYTHON_USEDEP}] )
	>=dev-python/opt-einsum-2.3.2[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.20.3[${PYTHON_USEDEP}] <dev-python/protobuf-5.0.0_pre[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.0[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.1[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.2[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.3[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.4[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.5[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/six-1.12.0[${PYTHON_USEDEP}]
	>=dev-python/tensorboard-2.14[${PYTHON_USEDEP}] <dev-python/tensorboard-2.15[${PYTHON_USEDEP}]
	~dev-python/tensorflow-cpu-aws-2.14.0.600[${PYTHON_USEDEP}]
	>=dev-python/tensorflow-estimator-2.14.0[${PYTHON_USEDEP}] <dev-python/tensorflow-estimator-2.15[${PYTHON_USEDEP}]
	>=dev-python/tensorflow-io-gcs-filesystem-0.23.1[${PYTHON_USEDEP}]
	and-cuda? ( ~dev-python/tensorrt-8.5.3.1[${PYTHON_USEDEP}] )
	>=dev-python/termcolor-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.6.6[${PYTHON_USEDEP}]
	>=dev-python/wrapt-1.11.0[${PYTHON_USEDEP}] <dev-python/wrapt-1.15[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
