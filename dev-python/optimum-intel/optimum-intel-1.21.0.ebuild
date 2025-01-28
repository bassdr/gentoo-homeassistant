# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="diffusers ipex neural-compressor nncf openvino quality tests"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/optimum-intel/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	neural-compressor? ( dev-python/accelerate[${PYTHON_USEDEP}] )
	tests? ( dev-python/accelerate[${PYTHON_USEDEP}] )
	quality? ( ~dev-python/black-23.1[${PYTHON_USEDEP}] )
	>=dev-python/datasets-1.4.0[${PYTHON_USEDEP}]
	diffusers? ( dev-python/diffusers[${PYTHON_USEDEP}] )
	tests? ( dev-python/diffusers[${PYTHON_USEDEP}] )
	tests? ( dev-python/einops[${PYTHON_USEDEP}] )
	tests? ( dev-python/evaluate[${PYTHON_USEDEP}] )
	ipex? ( >=dev-python/intel-extension-for-pytorch-2.4[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/invisible-watermark-0.2.0[${PYTHON_USEDEP}] )
	neural-compressor? ( >dev-python/neural-compressor-3.0[pt,${PYTHON_USEDEP}] )
	nncf? ( >=dev-python/nncf-2.14.0[${PYTHON_USEDEP}] )
	openvino? ( >=dev-python/nncf-2.14.0[${PYTHON_USEDEP}] )
	dev-python/onnx[${PYTHON_USEDEP}]
	tests? ( >=dev-python/open-clip-torch-2.26.1[${PYTHON_USEDEP}] )
	openvino? ( >=dev-python/openvino-2024.5.0[${PYTHON_USEDEP}] )
	openvino? ( >=dev-python/openvino-tokenizers-2024.5.0[${PYTHON_USEDEP}] )
	~dev-python/optimum-1.23[${PYTHON_USEDEP}]
	tests? ( dev-python/parameterized[${PYTHON_USEDEP}] )
	tests? ( dev-python/peft[${PYTHON_USEDEP}] )
	tests? ( dev-python/pillow[${PYTHON_USEDEP}] )
	tests? ( dev-python/py-cpuinfo[${PYTHON_USEDEP}] )
	tests? ( <dev-python/pytest-8.0.0[${PYTHON_USEDEP}] )
	tests? ( dev-python/rjieba[${PYTHON_USEDEP}] )
	quality? ( ~dev-python/ruff-0.4.4[${PYTHON_USEDEP}] )
	tests? ( dev-python/sacremoses[${PYTHON_USEDEP}] )
	dev-python/scipy[${PYTHON_USEDEP}]
	tests? ( dev-python/sentence-transformers[${PYTHON_USEDEP}] )
	dev-python/sentencepiece[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	tests? ( dev-python/tiktoken[${PYTHON_USEDEP}] )
	tests? ( dev-python/timm[${PYTHON_USEDEP}] )
	>=dev-python/torch-1.11[${PYTHON_USEDEP}]
	tests? ( dev-python/torchaudio[${PYTHON_USEDEP}] )
	<dev-python/transformers-4.47[${PYTHON_USEDEP}]
	ipex? ( <dev-python/transformers-4.47[${PYTHON_USEDEP}] )
	neural-compressor? ( <dev-python/transformers-4.46[${PYTHON_USEDEP}] )
	tests? ( dev-python/transformers-stream-generator[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest