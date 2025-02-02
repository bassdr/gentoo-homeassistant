# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="audio runai tensorizer video"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/vllm/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/blake3[${PYTHON_USEDEP}]
	runai? ( dev-python/boto3[${PYTHON_USEDEP}] )
	dev-python/cloudpickle[${PYTHON_USEDEP}]
	~dev-python/compressed-tensors-0.9.0[${PYTHON_USEDEP}]
	video? ( dev-python/decord[${PYTHON_USEDEP}] )
	~dev-python/depyf-0.18.0[${PYTHON_USEDEP}]
	dev-python/einops[${PYTHON_USEDEP}]
	<dev-python/fastapi-0.113.0[${PYTHON_USEDEP}]
	>=dev-python/filelock-3.16.1[${PYTHON_USEDEP}]
	~dev-python/gguf-0.10.0[${PYTHON_USEDEP}]
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	~dev-python/lark-1.2.2[${PYTHON_USEDEP}]
	audio? ( dev-python/librosa[${PYTHON_USEDEP}] )
	<dev-python/lm-format-enforcer-0.11[${PYTHON_USEDEP}]
	>=dev-python/mistral-common-1.5.0[opencv,${PYTHON_USEDEP}]
	dev-python/msgspec[${PYTHON_USEDEP}]
	<dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/nvidia-ml-py-12.560.30[${PYTHON_USEDEP}]
	>=dev-python/openai-1.52.0[${PYTHON_USEDEP}]
	~dev-python/outlines-0.1.11[${PYTHON_USEDEP}]
	dev-python/partial-json-parser[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	>=dev-python/prometheus-client-0.18.0[${PYTHON_USEDEP}]
	>=dev-python/prometheus-fastapi-instrumentator-7.0.0[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/py-cpuinfo[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.9[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/pyzmq[${PYTHON_USEDEP}]
	>=dev-python/ray-2.9[default,${PYTHON_USEDEP}]
	>=dev-python/requests-2.26.0[${PYTHON_USEDEP}]
	runai? ( dev-python/runai-model-streamer[${PYTHON_USEDEP}] )
	runai? ( dev-python/runai-model-streamer-s3[${PYTHON_USEDEP}] )
	dev-python/sentencepiece[${PYTHON_USEDEP}]
	>=dev-python/setuptools-74.1.1[${PYTHON_USEDEP}]
	>=dev-python/six-1.16.0[${PYTHON_USEDEP}]
	audio? ( dev-python/soundfile[${PYTHON_USEDEP}] )
	tensorizer? ( >=dev-python/tensorizer-2.9.0[${PYTHON_USEDEP}] )
	>=dev-python/tiktoken-0.6.0[${PYTHON_USEDEP}]
	~dev-python/torch-2.5.1[${PYTHON_USEDEP}]
	~dev-python/torchaudio-2.5.1[${PYTHON_USEDEP}]
	~dev-python/torchvision-0.20.1[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	>=dev-python/transformers-4.48.2[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.10[${PYTHON_USEDEP}]
	dev-python/uvicorn[standard,${PYTHON_USEDEP}]
	~dev-python/xformers-0.0.28_p3[${PYTHON_USEDEP}]
	>=dev-python/xgrammar-0.1.6[${PYTHON_USEDEP}]
	>=sci-libs/tokenizers-0.19.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
