# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="amd benchmark diffusers doc-build exporters exporters-gpu exporters-tf furiosa graphcore habana intel ipex neural-compressor neuron neuronx nncf onnxruntime onnxruntime-gpu onnxruntime-training openvino quality quanto"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/optimum/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Pillow; extra == 'dev'
	Pillow; extra == 'tests'
	accelerate; extra == 'dev'
	accelerate; extra == 'doc-build'
	accelerate; extra == 'onnxruntime-training'
	accelerate; extra == 'tests'
	black~=23.1; extra == 'dev'
	black~=23.1; extra == 'quality'
	datasets<=2.16; extra == 'exporters-tf'
	datasets>=1.2.1; extra == 'onnxruntime'
	datasets>=1.2.1; extra == 'onnxruntime-gpu'
	datasets>=1.2.1; extra == 'onnxruntime-training'
	diffusers; extra == 'diffusers'
	einops; extra == 'dev'
	einops; extra == 'tests'
	evaluate; extra == 'onnxruntime'
	evaluate; extra == 'onnxruntime-gpu'
	evaluate; extra == 'onnxruntime-training'
	evaluate>=0.2.0; extra == 'benchmark'
	h5py; extra == 'exporters-tf'
	huggingface-hub>=0.8.0
	numpy
	numpy<1.24.0; extra == 'exporters-tf'
	onnx; extra == 'exporters'
	onnx; extra == 'exporters-gpu'
	onnx; extra == 'exporters-tf'
	onnx; extra == 'onnxruntime'
	onnx; extra == 'onnxruntime-gpu'
	onnxruntime-gpu; extra == 'exporters-gpu'
	onnxruntime-gpu>=1.11.0; extra == 'onnxruntime-gpu'
	onnxruntime-training>=1.11.0; extra == 'onnxruntime-training'
	onnxruntime; extra == 'exporters'
	onnxruntime; extra == 'exporters-tf'
	onnxruntime>=1.11.0; extra == 'onnxruntime'
	optimum-amd; extra == 'amd'
	optimum-furiosa; extra == 'furiosa'
	optimum-graphcore; extra == 'graphcore'
	optimum-habana; extra == 'habana'
	optimum-intel>=1.18.0; extra == 'intel'
	optimum-intel[ipex]>=1.18.0; extra == 'ipex'
	optimum-intel[neural-compressor]>=1.18.0; extra == 'neural-compressor'
	optimum-intel[nncf]>=1.18.0; extra == 'nncf'
	optimum-intel[openvino]>=1.18.0; extra == 'openvino'
	optimum-neuron[neuron]>=0.0.20; extra == 'neuron'
	optimum-neuron[neuronx]>=0.0.20; extra == 'neuronx'
	optimum-quanto>=0.2.4; extra == 'quanto'
	optuna; extra == 'benchmark'
	packaging
	parameterized; extra == 'dev'
	parameterized; extra == 'tests'
	protobuf>=3.20.1; extra == 'onnxruntime'
	protobuf>=3.20.1; extra == 'onnxruntime-gpu'
	protobuf>=3.20.1; extra == 'onnxruntime-training'
	pytest-xdist; extra == 'dev'
	pytest-xdist; extra == 'tests'
	pytest<=8.0.0; extra == 'dev'
	pytest<=8.0.0; extra == 'tests'
	requests; extra == 'dev'
	requests; extra == 'tests'
	rjieba; extra == 'dev'
	rjieba; extra == 'tests'
	ruff==0.1.5; extra == 'dev'
	ruff==0.1.5; extra == 'quality'
	sacremoses; extra == 'dev'
	sacremoses; extra == 'tests'
	scikit-learn; extra == 'benchmark'
	scikit-learn; extra == 'dev'
	scikit-learn; extra == 'tests'
	sentencepiece; extra == 'dev'
	sentencepiece; extra == 'tests'
	seqeval; extra == 'benchmark'
	tensorflow<=2.12.1,>=2.4; extra == 'exporters-tf'
	tf2onnx; extra == 'exporters-tf'
	timm; extra == 'dev'
	timm; extra == 'exporters'
	timm; extra == 'exporters-gpu'
	timm; extra == 'exporters-tf'
	timm; extra == 'tests'
	torch-ort; extra == 'onnxruntime-training'
	torch>=1.11
	torchaudio; extra == 'dev'
	torchaudio; extra == 'tests'
	torchvision; extra == 'benchmark'
	torchvision; extra == 'dev'
	torchvision; extra == 'tests'
	tqdm; extra == 'benchmark'
	transformers<4.38,>=4.36; extra == 'exporters-tf'
	transformers<4.42.0,>=4.36.2; extra == 'neuron'
	transformers<4.42.0,>=4.36.2; extra == 'neuronx'
	transformers<4.46.0,>=4.45.0; extra == 'habana'
	transformers<4.49.0,>=4.36; extra == 'exporters'
	transformers<4.49.0,>=4.36; extra == 'exporters-gpu'
	transformers<4.49.0,>=4.36; extra == 'onnxruntime'
	transformers<4.49.0,>=4.36; extra == 'onnxruntime-gpu'
	transformers<4.49.0,>=4.36; extra == 'onnxruntime-training'
	transformers>=4.29
"
GENERATED_RDEPEND="${RDEPEND}
	doc-build? ( dev-python/accelerate[${PYTHON_USEDEP}] )
	onnxruntime-training? ( dev-python/accelerate[${PYTHON_USEDEP}] )
	quality? ( >=dev-python/black-23.1[${PYTHON_USEDEP}] =dev-python/black-23*[${PYTHON_USEDEP}] )
	exporters-tf? ( <=dev-python/datasets-2.16[${PYTHON_USEDEP}] )
	onnxruntime-gpu? ( >=dev-python/datasets-1.2.1[${PYTHON_USEDEP}] )
	onnxruntime-training? ( >=dev-python/datasets-1.2.1[${PYTHON_USEDEP}] )
	onnxruntime? ( >=dev-python/datasets-1.2.1[${PYTHON_USEDEP}] )
	diffusers? ( dev-python/diffusers[${PYTHON_USEDEP}] )
	benchmark? ( >=dev-python/evaluate-0.2.0[${PYTHON_USEDEP}] )
	onnxruntime-gpu? ( dev-python/evaluate[${PYTHON_USEDEP}] )
	onnxruntime-training? ( dev-python/evaluate[${PYTHON_USEDEP}] )
	onnxruntime? ( dev-python/evaluate[${PYTHON_USEDEP}] )
	exporters-tf? ( dev-python/h5py[${PYTHON_USEDEP}] )
	>=dev-python/huggingface-hub-0.8.0[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	exporters-tf? ( <dev-python/numpy-1.24.0[${PYTHON_USEDEP}] )
	exporters-gpu? ( dev-python/onnx[${PYTHON_USEDEP}] )
	exporters-tf? ( dev-python/onnx[${PYTHON_USEDEP}] )
	exporters? ( dev-python/onnx[${PYTHON_USEDEP}] )
	onnxruntime-gpu? ( dev-python/onnx[${PYTHON_USEDEP}] )
	onnxruntime? ( dev-python/onnx[${PYTHON_USEDEP}] )
	exporters-tf? ( dev-python/onnxruntime[${PYTHON_USEDEP}] )
	exporters? ( dev-python/onnxruntime[${PYTHON_USEDEP}] )
	onnxruntime? ( >=dev-python/onnxruntime-1.11.0[${PYTHON_USEDEP}] )
	exporters-gpu? ( dev-python/onnxruntime-gpu[${PYTHON_USEDEP}] )
	onnxruntime-gpu? ( >=dev-python/onnxruntime-gpu-1.11.0[${PYTHON_USEDEP}] )
	onnxruntime-training? ( >=dev-python/onnxruntime-training-1.11.0[${PYTHON_USEDEP}] )
	amd? ( dev-python/optimum-amd[${PYTHON_USEDEP}] )
	furiosa? ( dev-python/optimum-furiosa[${PYTHON_USEDEP}] )
	graphcore? ( dev-python/optimum-graphcore[${PYTHON_USEDEP}] )
	habana? ( dev-python/optimum-habana[${PYTHON_USEDEP}] )
	intel? ( >=dev-python/optimum-intel-1.18.0[${PYTHON_USEDEP}] )
	ipex? ( >=dev-python/optimum-intel-1.18.0[ipex,${PYTHON_USEDEP}] )
	neural-compressor? ( >=dev-python/optimum-intel-1.18.0[neural-compressor,${PYTHON_USEDEP}] )
	nncf? ( >=dev-python/optimum-intel-1.18.0[nncf,${PYTHON_USEDEP}] )
	openvino? ( >=dev-python/optimum-intel-1.18.0[openvino,${PYTHON_USEDEP}] )
	neuron? ( >=dev-python/optimum-neuron-0.0.20[neuron,${PYTHON_USEDEP}] )
	neuronx? ( >=dev-python/optimum-neuron-0.0.20[neuronx,${PYTHON_USEDEP}] )
	quanto? ( >=dev-python/optimum-quanto-0.2.4[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/optuna[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	onnxruntime-gpu? ( >=dev-python/protobuf-3.20.1[${PYTHON_USEDEP}] )
	onnxruntime-training? ( >=dev-python/protobuf-3.20.1[${PYTHON_USEDEP}] )
	onnxruntime? ( >=dev-python/protobuf-3.20.1[${PYTHON_USEDEP}] )
	quality? ( ~dev-python/ruff-0.1.5[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/seqeval[${PYTHON_USEDEP}] )
	exporters-tf? ( >=dev-python/tensorflow-2.4[${PYTHON_USEDEP}] <=dev-python/tensorflow-2.12.1[${PYTHON_USEDEP}] )
	exporters-tf? ( dev-python/tf2onnx[${PYTHON_USEDEP}] )
	exporters-gpu? ( dev-python/timm[${PYTHON_USEDEP}] )
	exporters-tf? ( dev-python/timm[${PYTHON_USEDEP}] )
	exporters? ( dev-python/timm[${PYTHON_USEDEP}] )
	>=dev-python/torch-1.11[${PYTHON_USEDEP}]
	onnxruntime-training? ( dev-python/torch-ort[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/torchvision[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/tqdm[${PYTHON_USEDEP}] )
	>=dev-python/transformers-4.29[${PYTHON_USEDEP}]
	exporters-gpu? ( >=dev-python/transformers-4.36[${PYTHON_USEDEP}] <dev-python/transformers-4.49.0[${PYTHON_USEDEP}] )
	exporters-tf? ( >=dev-python/transformers-4.36[${PYTHON_USEDEP}] <dev-python/transformers-4.38[${PYTHON_USEDEP}] )
	exporters? ( >=dev-python/transformers-4.36[${PYTHON_USEDEP}] <dev-python/transformers-4.49.0[${PYTHON_USEDEP}] )
	habana? ( >=dev-python/transformers-4.45.0[${PYTHON_USEDEP}] <dev-python/transformers-4.46.0[${PYTHON_USEDEP}] )
	neuron? ( >=dev-python/transformers-4.36.2[${PYTHON_USEDEP}] <dev-python/transformers-4.42.0[${PYTHON_USEDEP}] )
	neuronx? ( >=dev-python/transformers-4.36.2[${PYTHON_USEDEP}] <dev-python/transformers-4.42.0[${PYTHON_USEDEP}] )
	onnxruntime-gpu? ( >=dev-python/transformers-4.36[${PYTHON_USEDEP}] <dev-python/transformers-4.49.0[${PYTHON_USEDEP}] )
	onnxruntime-training? ( >=dev-python/transformers-4.36[${PYTHON_USEDEP}] <dev-python/transformers-4.49.0[${PYTHON_USEDEP}] )
	onnxruntime? ( >=dev-python/transformers-4.36[${PYTHON_USEDEP}] <dev-python/transformers-4.49.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/accelerate[${PYTHON_USEDEP}]
		>=dev-python/black-23.1[${PYTHON_USEDEP}] =dev-python/black-23*[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
		dev-python/parameterized[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		<=dev-python/pytest-8.0.0[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/rjieba[${PYTHON_USEDEP}]
		~dev-python/ruff-0.1.5[${PYTHON_USEDEP}]
		dev-python/sacremoses[${PYTHON_USEDEP}]
		dev-python/scikit-learn[${PYTHON_USEDEP}]
		dev-python/sentencepiece[${PYTHON_USEDEP}]
		dev-python/timm[${PYTHON_USEDEP}]
		dev-python/torchaudio[${PYTHON_USEDEP}]
		dev-python/torchvision[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
