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

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/absl-py-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/astunparse-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/flatbuffers-23.5.26[${PYTHON_USEDEP}]
	!=dev-python/gast-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/google-pasta-0.1.1[${PYTHON_USEDEP}]
	<dev-python/grpcio-2.0[${PYTHON_USEDEP}]
	>=dev-python/h5py-2.9.0[${PYTHON_USEDEP}]
	<dev-python/keras-2.15[${PYTHON_USEDEP}]
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
	!=dev-python/protobuf-4.21.0[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/six-1.12.0[${PYTHON_USEDEP}]
	<dev-python/tensorboard-2.15[${PYTHON_USEDEP}]
	~dev-python/tensorflow-cpu-aws-2.14.0.600[${PYTHON_USEDEP}]
	<dev-python/tensorflow-estimator-2.15[${PYTHON_USEDEP}]
	>=dev-python/tensorflow-io-gcs-filesystem-0.23.1[${PYTHON_USEDEP}]
	and-cuda? ( ~dev-python/tensorrt-8.5.3.1[${PYTHON_USEDEP}] )
	>=dev-python/termcolor-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.6.6[${PYTHON_USEDEP}]
	<dev-python/wrapt-1.15[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
