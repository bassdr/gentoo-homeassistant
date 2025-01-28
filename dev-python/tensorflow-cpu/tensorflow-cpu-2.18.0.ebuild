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

GENERATED_DEPEND="
	>=dev-python/absl-py-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/astunparse-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/flatbuffers-24.3.25[${PYTHON_USEDEP}]
	!=dev-python/gast-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/google-pasta-0.1.1[${PYTHON_USEDEP}]
	<dev-python/grpcio-2.0[${PYTHON_USEDEP}]
	>=dev-python/h5py-3.11.0[${PYTHON_USEDEP}]
	>=dev-python/keras-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/libclang-13.0.0[${PYTHON_USEDEP}]
	<dev-python/ml-dtypes-0.5.0[${PYTHON_USEDEP}]
	<dev-python/numpy-2.1.0[${PYTHON_USEDEP}]
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
	!=dev-python/protobuf-4.21.0[${PYTHON_USEDEP}]
	<dev-python/requests-3[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/six-1.12.0[${PYTHON_USEDEP}]
	<dev-python/tensorboard-2.19[${PYTHON_USEDEP}]
	~dev-python/tensorflow-intel-2.18.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/tensorflow-io-gcs-filesystem-0.23.1[${PYTHON_USEDEP}]' python3_12)
	>=dev-python/termcolor-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.6.6[${PYTHON_USEDEP}]
	>=dev-python/wrapt-1.11.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest