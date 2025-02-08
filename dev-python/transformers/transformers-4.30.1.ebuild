# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="accelerate agents all audio codecarbon deepspeed deepspeed-testing dev-tensorflow dev-torch docs docs_specific fairscale flax flax-speech ftfy integrations ja modelcreation natten onnx onnxruntime optuna quality ray retrieval sagemaker sentencepiece serving sigopt sklearn speech tf tf-cpu tf-speech timm tokenizers torch torch-speech torch-vision torchhub video vision"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/transformers/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	GitPython (<3.1.19) ; extra == 'deepspeed-testing'
	GitPython (<3.1.19) ; extra == 'dev'
	GitPython (<3.1.19) ; extra == 'dev-tensorflow'
	GitPython (<3.1.19) ; extra == 'dev-torch'
	GitPython (<3.1.19) ; extra == 'quality'
	GitPython (<3.1.19) ; extra == 'testing'
	Pillow ; extra == 'agents'
	Pillow ; extra == 'all'
	Pillow ; extra == 'dev'
	Pillow ; extra == 'dev-tensorflow'
	Pillow ; extra == 'dev-torch'
	Pillow ; extra == 'docs'
	Pillow ; extra == 'torch-vision'
	Pillow ; extra == 'vision'
	accelerate (>=0.20.2) ; extra == 'accelerate'
	accelerate (>=0.20.2) ; extra == 'agents'
	accelerate (>=0.20.2) ; extra == 'all'
	accelerate (>=0.20.2) ; extra == 'deepspeed'
	accelerate (>=0.20.2) ; extra == 'deepspeed-testing'
	accelerate (>=0.20.2) ; extra == 'dev'
	accelerate (>=0.20.2) ; extra == 'dev-torch'
	accelerate (>=0.20.2) ; extra == 'docs'
	accelerate (>=0.20.2) ; extra == 'torch'
	av (==9.2.0) ; extra == 'all'
	av (==9.2.0) ; extra == 'dev'
	av (==9.2.0) ; extra == 'docs'
	av (==9.2.0) ; extra == 'video'
	beautifulsoup4 ; extra == 'deepspeed-testing'
	beautifulsoup4 ; extra == 'dev'
	beautifulsoup4 ; extra == 'dev-tensorflow'
	beautifulsoup4 ; extra == 'dev-torch'
	beautifulsoup4 ; extra == 'testing'
	black (~=23.1) ; extra == 'deepspeed-testing'
	black (~=23.1) ; extra == 'dev'
	black (~=23.1) ; extra == 'dev-tensorflow'
	black (~=23.1) ; extra == 'dev-torch'
	black (~=23.1) ; extra == 'quality'
	black (~=23.1) ; extra == 'testing'
	codecarbon (==1.2.0) ; extra == 'all'
	codecarbon (==1.2.0) ; extra == 'codecarbon'
	codecarbon (==1.2.0) ; extra == 'dev'
	codecarbon (==1.2.0) ; extra == 'dev-torch'
	codecarbon (==1.2.0) ; extra == 'docs'
	cookiecutter (==1.7.3) ; extra == 'deepspeed-testing'
	cookiecutter (==1.7.3) ; extra == 'dev'
	cookiecutter (==1.7.3) ; extra == 'dev-tensorflow'
	cookiecutter (==1.7.3) ; extra == 'dev-torch'
	cookiecutter (==1.7.3) ; extra == 'modelcreation'
	cookiecutter (==1.7.3) ; extra == 'testing'
	datasets (!=2.5.0) ; extra == 'agents'
	datasets (!=2.5.0) ; extra == 'deepspeed-testing'
	datasets (!=2.5.0) ; extra == 'dev'
	datasets (!=2.5.0) ; extra == 'dev-tensorflow'
	datasets (!=2.5.0) ; extra == 'dev-torch'
	datasets (!=2.5.0) ; extra == 'quality'
	datasets (!=2.5.0) ; extra == 'retrieval'
	datasets (!=2.5.0) ; extra == 'testing'
	decord (==0.6.0) ; extra == 'all'
	decord (==0.6.0) ; extra == 'dev'
	decord (==0.6.0) ; extra == 'docs'
	decord (==0.6.0) ; extra == 'video'
	deepspeed (>=0.8.3) ; extra == 'deepspeed'
	deepspeed (>=0.8.3) ; extra == 'deepspeed-testing'
	diffusers ; extra == 'agents'
	dill (<0.3.5) ; extra == 'deepspeed-testing'
	dill (<0.3.5) ; extra == 'dev'
	dill (<0.3.5) ; extra == 'dev-tensorflow'
	dill (<0.3.5) ; extra == 'dev-torch'
	dill (<0.3.5) ; extra == 'testing'
	evaluate (>=0.2.0) ; extra == 'deepspeed-testing'
	evaluate (>=0.2.0) ; extra == 'dev'
	evaluate (>=0.2.0) ; extra == 'dev-tensorflow'
	evaluate (>=0.2.0) ; extra == 'dev-torch'
	evaluate (>=0.2.0) ; extra == 'testing'
	fairscale (>0.3) ; extra == 'fairscale'
	faiss-cpu ; extra == 'deepspeed-testing'
	faiss-cpu ; extra == 'dev'
	faiss-cpu ; extra == 'dev-tensorflow'
	faiss-cpu ; extra == 'dev-torch'
	faiss-cpu ; extra == 'retrieval'
	faiss-cpu ; extra == 'testing'
	fastapi ; extra == 'serving'
	filelock
	filelock ; extra == 'torchhub'
	flax (<=0.6.9,>=0.4.1) ; extra == 'all'
	flax (<=0.6.9,>=0.4.1) ; extra == 'dev'
	flax (<=0.6.9,>=0.4.1) ; extra == 'docs'
	flax (<=0.6.9,>=0.4.1) ; extra == 'flax'
	ftfy ; extra == 'ftfy'
	fugashi (>=1.0) ; extra == 'dev'
	fugashi (>=1.0) ; extra == 'dev-torch'
	fugashi (>=1.0) ; extra == 'ja'
	hf-doc-builder (>=0.3.0) ; extra == 'deepspeed-testing'
	hf-doc-builder (>=0.3.0) ; extra == 'dev'
	hf-doc-builder (>=0.3.0) ; extra == 'dev-tensorflow'
	hf-doc-builder (>=0.3.0) ; extra == 'dev-torch'
	hf-doc-builder (>=0.3.0) ; extra == 'quality'
	hf-doc-builder (>=0.3.0) ; extra == 'testing'
	hf-doc-builder ; extra == 'dev'
	hf-doc-builder ; extra == 'dev-tensorflow'
	hf-doc-builder ; extra == 'dev-torch'
	hf-doc-builder ; extra == 'docs'
	hf-doc-builder ; extra == 'docs_specific'
	huggingface-hub (<1.0,>=0.14.1)
	huggingface-hub (<1.0,>=0.14.1) ; extra == 'torchhub'
	importlib-metadata ; extra == 'torchhub'
	importlib-metadata ; python_version < "3.8"
	ipadic (<2.0,>=1.0.0) ; extra == 'dev'
	ipadic (<2.0,>=1.0.0) ; extra == 'dev-torch'
	ipadic (<2.0,>=1.0.0) ; extra == 'ja'
	isort (>=5.5.4) ; extra == 'dev'
	isort (>=5.5.4) ; extra == 'dev-tensorflow'
	isort (>=5.5.4) ; extra == 'dev-torch'
	isort (>=5.5.4) ; extra == 'quality'
	jax (!=0.3.2,<=0.3.6,>=0.2.8) ; extra == 'all'
	jax (!=0.3.2,<=0.3.6,>=0.2.8) ; extra == 'dev'
	jax (!=0.3.2,<=0.3.6,>=0.2.8) ; extra == 'docs'
	jax (!=0.3.2,<=0.3.6,>=0.2.8) ; extra == 'flax'
	jaxlib (<=0.3.6,>=0.1.65) ; extra == 'all'
	jaxlib (<=0.3.6,>=0.1.65) ; extra == 'dev'
	jaxlib (<=0.3.6,>=0.1.65) ; extra == 'docs'
	jaxlib (<=0.3.6,>=0.1.65) ; extra == 'flax'
	kenlm ; extra == 'all'
	kenlm ; extra == 'audio'
	kenlm ; extra == 'dev'
	kenlm ; extra == 'dev-tensorflow'
	kenlm ; extra == 'dev-torch'
	kenlm ; extra == 'docs'
	kenlm ; extra == 'flax-speech'
	kenlm ; extra == 'speech'
	kenlm ; extra == 'tf-speech'
	kenlm ; extra == 'torch-speech'
	keras-nlp (>=0.3.1) ; extra == 'all'
	keras-nlp (>=0.3.1) ; extra == 'dev'
	keras-nlp (>=0.3.1) ; extra == 'dev-tensorflow'
	keras-nlp (>=0.3.1) ; extra == 'docs'
	keras-nlp (>=0.3.1) ; extra == 'tf'
	keras-nlp (>=0.3.1) ; extra == 'tf-cpu'
	librosa ; extra == 'all'
	librosa ; extra == 'audio'
	librosa ; extra == 'dev'
	librosa ; extra == 'dev-tensorflow'
	librosa ; extra == 'dev-torch'
	librosa ; extra == 'docs'
	librosa ; extra == 'flax-speech'
	librosa ; extra == 'speech'
	librosa ; extra == 'tf-speech'
	librosa ; extra == 'torch-speech'
	natten (>=0.14.6) ; extra == 'natten'
	nltk ; extra == 'deepspeed-testing'
	nltk ; extra == 'dev'
	nltk ; extra == 'dev-tensorflow'
	nltk ; extra == 'dev-torch'
	nltk ; extra == 'testing'
	numpy (>=1.17)
	numpy (>=1.17) ; extra == 'torchhub'
	onnxconverter-common ; extra == 'all'
	onnxconverter-common ; extra == 'dev'
	onnxconverter-common ; extra == 'dev-tensorflow'
	onnxconverter-common ; extra == 'docs'
	onnxconverter-common ; extra == 'onnx'
	onnxconverter-common ; extra == 'tf'
	onnxconverter-common ; extra == 'tf-cpu'
	onnxruntime (>=1.4.0) ; extra == 'dev-tensorflow'
	onnxruntime (>=1.4.0) ; extra == 'dev-torch'
	onnxruntime (>=1.4.0) ; extra == 'onnx'
	onnxruntime (>=1.4.0) ; extra == 'onnxruntime'
	onnxruntime-tools (>=1.4.2) ; extra == 'dev-tensorflow'
	onnxruntime-tools (>=1.4.2) ; extra == 'dev-torch'
	onnxruntime-tools (>=1.4.2) ; extra == 'onnx'
	onnxruntime-tools (>=1.4.2) ; extra == 'onnxruntime'
	opencv-python ; extra == 'agents'
	optax (<=0.1.4,>=0.0.8) ; extra == 'all'
	optax (<=0.1.4,>=0.0.8) ; extra == 'dev'
	optax (<=0.1.4,>=0.0.8) ; extra == 'docs'
	optax (<=0.1.4,>=0.0.8) ; extra == 'flax'
	optuna ; extra == 'all'
	optuna ; extra == 'deepspeed-testing'
	optuna ; extra == 'dev'
	optuna ; extra == 'dev-torch'
	optuna ; extra == 'docs'
	optuna ; extra == 'integrations'
	optuna ; extra == 'optuna'
	packaging (>=20.0)
	packaging (>=20.0) ; extra == 'torchhub'
	parameterized ; extra == 'deepspeed-testing'
	parameterized ; extra == 'dev'
	parameterized ; extra == 'dev-tensorflow'
	parameterized ; extra == 'dev-torch'
	parameterized ; extra == 'testing'
	phonemizer ; extra == 'all'
	phonemizer ; extra == 'audio'
	phonemizer ; extra == 'dev'
	phonemizer ; extra == 'dev-tensorflow'
	phonemizer ; extra == 'dev-torch'
	phonemizer ; extra == 'docs'
	phonemizer ; extra == 'flax-speech'
	phonemizer ; extra == 'speech'
	phonemizer ; extra == 'tf-speech'
	phonemizer ; extra == 'torch-speech'
	protobuf (<=3.20.3) ; extra == 'all'
	protobuf (<=3.20.3) ; extra == 'deepspeed-testing'
	protobuf (<=3.20.3) ; extra == 'dev'
	protobuf (<=3.20.3) ; extra == 'dev-tensorflow'
	protobuf (<=3.20.3) ; extra == 'dev-torch'
	protobuf (<=3.20.3) ; extra == 'docs'
	protobuf (<=3.20.3) ; extra == 'sentencepiece'
	protobuf (<=3.20.3) ; extra == 'testing'
	protobuf (<=3.20.3) ; extra == 'torchhub'
	psutil ; extra == 'deepspeed-testing'
	psutil ; extra == 'dev'
	psutil ; extra == 'dev-tensorflow'
	psutil ; extra == 'dev-torch'
	psutil ; extra == 'testing'
	pyctcdecode (>=0.4.0) ; extra == 'all'
	pyctcdecode (>=0.4.0) ; extra == 'audio'
	pyctcdecode (>=0.4.0) ; extra == 'dev'
	pyctcdecode (>=0.4.0) ; extra == 'dev-tensorflow'
	pyctcdecode (>=0.4.0) ; extra == 'dev-torch'
	pyctcdecode (>=0.4.0) ; extra == 'docs'
	pyctcdecode (>=0.4.0) ; extra == 'flax-speech'
	pyctcdecode (>=0.4.0) ; extra == 'speech'
	pyctcdecode (>=0.4.0) ; extra == 'tf-speech'
	pyctcdecode (>=0.4.0) ; extra == 'torch-speech'
	pydantic ; extra == 'serving'
	pytest (>=7.2.0) ; extra == 'deepspeed-testing'
	pytest (>=7.2.0) ; extra == 'dev'
	pytest (>=7.2.0) ; extra == 'dev-tensorflow'
	pytest (>=7.2.0) ; extra == 'dev-torch'
	pytest (>=7.2.0) ; extra == 'testing'
	pytest-timeout ; extra == 'deepspeed-testing'
	pytest-timeout ; extra == 'dev'
	pytest-timeout ; extra == 'dev-tensorflow'
	pytest-timeout ; extra == 'dev-torch'
	pytest-timeout ; extra == 'testing'
	pytest-xdist ; extra == 'deepspeed-testing'
	pytest-xdist ; extra == 'dev'
	pytest-xdist ; extra == 'dev-tensorflow'
	pytest-xdist ; extra == 'dev-torch'
	pytest-xdist ; extra == 'testing'
	pyyaml (>=5.1)
	ray[tune] ; extra == 'all'
	ray[tune] ; extra == 'dev'
	ray[tune] ; extra == 'dev-torch'
	ray[tune] ; extra == 'docs'
	ray[tune] ; extra == 'integrations'
	ray[tune] ; extra == 'ray'
	regex (!=2019.12.17)
	regex (!=2019.12.17) ; extra == 'torchhub'
	requests
	requests ; extra == 'torchhub'
	rhoknp (<1.3.1,>=1.1.0) ; extra == 'dev'
	rhoknp (<1.3.1,>=1.1.0) ; extra == 'dev-torch'
	rhoknp (<1.3.1,>=1.1.0) ; extra == 'ja'
	rjieba ; extra == 'deepspeed-testing'
	rjieba ; extra == 'dev'
	rjieba ; extra == 'dev-tensorflow'
	rjieba ; extra == 'dev-torch'
	rjieba ; extra == 'testing'
	rouge-score (!=0.0.7,!=0.0.8,!=0.1,!=0.1.1) ; extra == 'deepspeed-testing'
	rouge-score (!=0.0.7,!=0.0.8,!=0.1,!=0.1.1) ; extra == 'dev'
	rouge-score (!=0.0.7,!=0.0.8,!=0.1,!=0.1.1) ; extra == 'dev-tensorflow'
	rouge-score (!=0.0.7,!=0.0.8,!=0.1,!=0.1.1) ; extra == 'dev-torch'
	rouge-score (!=0.0.7,!=0.0.8,!=0.1,!=0.1.1) ; extra == 'testing'
	ruff (<=0.0.259,>=0.0.241) ; extra == 'dev'
	ruff (<=0.0.259,>=0.0.241) ; extra == 'dev-tensorflow'
	ruff (<=0.0.259,>=0.0.241) ; extra == 'dev-torch'
	ruff (<=0.0.259,>=0.0.241) ; extra == 'quality'
	sacrebleu (<2.0.0,>=1.4.12) ; extra == 'deepspeed-testing'
	sacrebleu (<2.0.0,>=1.4.12) ; extra == 'dev'
	sacrebleu (<2.0.0,>=1.4.12) ; extra == 'dev-tensorflow'
	sacrebleu (<2.0.0,>=1.4.12) ; extra == 'dev-torch'
	sacrebleu (<2.0.0,>=1.4.12) ; extra == 'testing'
	sacremoses ; extra == 'deepspeed-testing'
	sacremoses ; extra == 'dev'
	sacremoses ; extra == 'dev-tensorflow'
	sacremoses ; extra == 'dev-torch'
	sacremoses ; extra == 'testing'
	safetensors (>=0.3.1)
	sagemaker (>=2.31.0) ; extra == 'sagemaker'
	scikit-learn ; extra == 'dev'
	scikit-learn ; extra == 'dev-tensorflow'
	scikit-learn ; extra == 'dev-torch'
	scikit-learn ; extra == 'sklearn'
	sentencepiece (!=0.1.92,>=0.1.91) ; extra == 'agents'
	sentencepiece (!=0.1.92,>=0.1.91) ; extra == 'all'
	sentencepiece (!=0.1.92,>=0.1.91) ; extra == 'deepspeed-testing'
	sentencepiece (!=0.1.92,>=0.1.91) ; extra == 'dev'
	sentencepiece (!=0.1.92,>=0.1.91) ; extra == 'dev-tensorflow'
	sentencepiece (!=0.1.92,>=0.1.91) ; extra == 'dev-torch'
	sentencepiece (!=0.1.92,>=0.1.91) ; extra == 'docs'
	sentencepiece (!=0.1.92,>=0.1.91) ; extra == 'sentencepiece'
	sentencepiece (!=0.1.92,>=0.1.91) ; extra == 'torchhub'
	sigopt ; extra == 'all'
	sigopt ; extra == 'dev'
	sigopt ; extra == 'dev-torch'
	sigopt ; extra == 'docs'
	sigopt ; extra == 'integrations'
	sigopt ; extra == 'sigopt'
	starlette ; extra == 'serving'
	sudachidict-core (>=20220729) ; extra == 'dev'
	sudachidict-core (>=20220729) ; extra == 'dev-torch'
	sudachidict-core (>=20220729) ; extra == 'ja'
	sudachipy (>=0.6.6) ; extra == 'dev'
	sudachipy (>=0.6.6) ; extra == 'dev-torch'
	sudachipy (>=0.6.6) ; extra == 'ja'
	tensorflow (<2.13,>=2.4) ; extra == 'all'
	tensorflow (<2.13,>=2.4) ; extra == 'dev'
	tensorflow (<2.13,>=2.4) ; extra == 'dev-tensorflow'
	tensorflow (<2.13,>=2.4) ; extra == 'docs'
	tensorflow (<2.13,>=2.4) ; extra == 'tf'
	tensorflow-cpu (<2.13,>=2.4) ; extra == 'tf-cpu'
	tensorflow-text (<2.13) ; extra == 'all'
	tensorflow-text (<2.13) ; extra == 'dev'
	tensorflow-text (<2.13) ; extra == 'dev-tensorflow'
	tensorflow-text (<2.13) ; extra == 'docs'
	tensorflow-text (<2.13) ; extra == 'tf'
	tensorflow-text (<2.13) ; extra == 'tf-cpu'
	tf2onnx ; extra == 'all'
	tf2onnx ; extra == 'dev'
	tf2onnx ; extra == 'dev-tensorflow'
	tf2onnx ; extra == 'docs'
	tf2onnx ; extra == 'onnx'
	tf2onnx ; extra == 'tf'
	tf2onnx ; extra == 'tf-cpu'
	timeout-decorator ; extra == 'deepspeed-testing'
	timeout-decorator ; extra == 'dev'
	timeout-decorator ; extra == 'dev-tensorflow'
	timeout-decorator ; extra == 'dev-torch'
	timeout-decorator ; extra == 'testing'
	timm ; extra == 'all'
	timm ; extra == 'dev'
	timm ; extra == 'dev-torch'
	timm ; extra == 'docs'
	timm ; extra == 'timm'
	tokenizers (!=0.11.3,<0.14,>=0.11.1)
	tokenizers (!=0.11.3,<0.14,>=0.11.1) ; extra == 'all'
	tokenizers (!=0.11.3,<0.14,>=0.11.1) ; extra == 'dev'
	tokenizers (!=0.11.3,<0.14,>=0.11.1) ; extra == 'dev-tensorflow'
	tokenizers (!=0.11.3,<0.14,>=0.11.1) ; extra == 'dev-torch'
	tokenizers (!=0.11.3,<0.14,>=0.11.1) ; extra == 'docs'
	tokenizers (!=0.11.3,<0.14,>=0.11.1) ; extra == 'tokenizers'
	tokenizers (!=0.11.3,<0.14,>=0.11.1) ; extra == 'torchhub'
	torch (!=1.12.0,>=1.9) ; extra == 'agents'
	torch (!=1.12.0,>=1.9) ; extra == 'all'
	torch (!=1.12.0,>=1.9) ; extra == 'dev'
	torch (!=1.12.0,>=1.9) ; extra == 'dev-torch'
	torch (!=1.12.0,>=1.9) ; extra == 'docs'
	torch (!=1.12.0,>=1.9) ; extra == 'torch'
	torch (!=1.12.0,>=1.9) ; extra == 'torchhub'
	torchaudio ; extra == 'all'
	torchaudio ; extra == 'dev'
	torchaudio ; extra == 'dev-torch'
	torchaudio ; extra == 'docs'
	torchaudio ; extra == 'speech'
	torchaudio ; extra == 'torch-speech'
	torchvision ; extra == 'all'
	torchvision ; extra == 'dev'
	torchvision ; extra == 'dev-torch'
	torchvision ; extra == 'docs'
	torchvision ; extra == 'torch-vision'
	tqdm (>=4.27)
	tqdm (>=4.27) ; extra == 'torchhub'
	unidic (>=1.0.2) ; extra == 'dev'
	unidic (>=1.0.2) ; extra == 'dev-torch'
	unidic (>=1.0.2) ; extra == 'ja'
	unidic-lite (>=1.0.7) ; extra == 'dev'
	unidic-lite (>=1.0.7) ; extra == 'dev-torch'
	unidic-lite (>=1.0.7) ; extra == 'ja'
	urllib3 (<2.0.0) ; extra == 'dev'
	urllib3 (<2.0.0) ; extra == 'dev-tensorflow'
	urllib3 (<2.0.0) ; extra == 'dev-torch'
	urllib3 (<2.0.0) ; extra == 'quality'
	uvicorn ; extra == 'serving'
"
GENERATED_RDEPEND="${RDEPEND}
	accelerate? ( >=dev-python/accelerate-0.20.2[${PYTHON_USEDEP}] )
	agents? ( >=dev-python/accelerate-0.20.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/accelerate-0.20.2[${PYTHON_USEDEP}] )
	deepspeed-testing? ( >=dev-python/accelerate-0.20.2[${PYTHON_USEDEP}] )
	deepspeed? ( >=dev-python/accelerate-0.20.2[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/accelerate-0.20.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/accelerate-0.20.2[${PYTHON_USEDEP}] )
	torch? ( >=dev-python/accelerate-0.20.2[${PYTHON_USEDEP}] )
	all? ( ~dev-python/av-9.2.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/av-9.2.0[${PYTHON_USEDEP}] )
	video? ( ~dev-python/av-9.2.0[${PYTHON_USEDEP}] )
	deepspeed-testing? ( dev-python/beautifulsoup4[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/beautifulsoup4[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/beautifulsoup4[${PYTHON_USEDEP}] )
	deepspeed-testing? ( >=dev-python/black-23.1[${PYTHON_USEDEP}] =dev-python/black-23*[${PYTHON_USEDEP}] )
	dev-tensorflow? ( >=dev-python/black-23.1[${PYTHON_USEDEP}] =dev-python/black-23*[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/black-23.1[${PYTHON_USEDEP}] =dev-python/black-23*[${PYTHON_USEDEP}] )
	quality? ( >=dev-python/black-23.1[${PYTHON_USEDEP}] =dev-python/black-23*[${PYTHON_USEDEP}] )
	all? ( ~dev-python/codecarbon-1.2.0[${PYTHON_USEDEP}] )
	codecarbon? ( ~dev-python/codecarbon-1.2.0[${PYTHON_USEDEP}] )
	dev-torch? ( ~dev-python/codecarbon-1.2.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/codecarbon-1.2.0[${PYTHON_USEDEP}] )
	deepspeed-testing? ( ~dev-python/cookiecutter-1.7.3[${PYTHON_USEDEP}] )
	dev-tensorflow? ( ~dev-python/cookiecutter-1.7.3[${PYTHON_USEDEP}] )
	dev-torch? ( ~dev-python/cookiecutter-1.7.3[${PYTHON_USEDEP}] )
	modelcreation? ( ~dev-python/cookiecutter-1.7.3[${PYTHON_USEDEP}] )
	agents? ( !~dev-python/datasets-2.5.0[${PYTHON_USEDEP}] )
	deepspeed-testing? ( !~dev-python/datasets-2.5.0[${PYTHON_USEDEP}] )
	dev-tensorflow? ( !~dev-python/datasets-2.5.0[${PYTHON_USEDEP}] )
	dev-torch? ( !~dev-python/datasets-2.5.0[${PYTHON_USEDEP}] )
	quality? ( !~dev-python/datasets-2.5.0[${PYTHON_USEDEP}] )
	retrieval? ( !~dev-python/datasets-2.5.0[${PYTHON_USEDEP}] )
	all? ( ~dev-python/decord-0.6.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/decord-0.6.0[${PYTHON_USEDEP}] )
	video? ( ~dev-python/decord-0.6.0[${PYTHON_USEDEP}] )
	deepspeed-testing? ( >=dev-python/deepspeed-0.8.3[${PYTHON_USEDEP}] )
	deepspeed? ( >=dev-python/deepspeed-0.8.3[${PYTHON_USEDEP}] )
	agents? ( dev-python/diffusers[${PYTHON_USEDEP}] )
	deepspeed-testing? ( <dev-python/dill-0.3.5[${PYTHON_USEDEP}] )
	dev-tensorflow? ( <dev-python/dill-0.3.5[${PYTHON_USEDEP}] )
	dev-torch? ( <dev-python/dill-0.3.5[${PYTHON_USEDEP}] )
	deepspeed-testing? ( >=dev-python/evaluate-0.2.0[${PYTHON_USEDEP}] )
	dev-tensorflow? ( >=dev-python/evaluate-0.2.0[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/evaluate-0.2.0[${PYTHON_USEDEP}] )
	fairscale? ( >dev-python/fairscale-0.3[${PYTHON_USEDEP}] )
	deepspeed-testing? ( dev-python/faiss-cpu[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/faiss-cpu[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/faiss-cpu[${PYTHON_USEDEP}] )
	retrieval? ( dev-python/faiss-cpu[${PYTHON_USEDEP}] )
	serving? ( dev-python/fastapi[${PYTHON_USEDEP}] )
	dev-python/filelock[${PYTHON_USEDEP}]
	torchhub? ( dev-python/filelock[${PYTHON_USEDEP}] )
	all? ( >=dev-python/flax-0.4.1[${PYTHON_USEDEP}] <=dev-python/flax-0.6.9[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/flax-0.4.1[${PYTHON_USEDEP}] <=dev-python/flax-0.6.9[${PYTHON_USEDEP}] )
	flax? ( >=dev-python/flax-0.4.1[${PYTHON_USEDEP}] <=dev-python/flax-0.6.9[${PYTHON_USEDEP}] )
	ftfy? ( dev-python/ftfy[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/fugashi-1.0[${PYTHON_USEDEP}] )
	ja? ( >=dev-python/fugashi-1.0[${PYTHON_USEDEP}] )
	deepspeed-testing? ( <dev-python/gitpython-3.1.19[${PYTHON_USEDEP}] )
	dev-tensorflow? ( <dev-python/gitpython-3.1.19[${PYTHON_USEDEP}] )
	dev-torch? ( <dev-python/gitpython-3.1.19[${PYTHON_USEDEP}] )
	quality? ( <dev-python/gitpython-3.1.19[${PYTHON_USEDEP}] )
	deepspeed-testing? ( >=dev-python/hf-doc-builder-0.3.0[${PYTHON_USEDEP}] )
	dev-tensorflow? ( >=dev-python/hf-doc-builder-0.3.0[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/hf-doc-builder[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/hf-doc-builder-0.3.0[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/hf-doc-builder[${PYTHON_USEDEP}] )
	docs? ( dev-python/hf-doc-builder[${PYTHON_USEDEP}] )
	docs_specific? ( dev-python/hf-doc-builder[${PYTHON_USEDEP}] )
	quality? ( >=dev-python/hf-doc-builder-0.3.0[${PYTHON_USEDEP}] )
	>=dev-python/huggingface-hub-0.14.1[${PYTHON_USEDEP}] <dev-python/huggingface-hub-1.0[${PYTHON_USEDEP}]
	torchhub? ( >=dev-python/huggingface-hub-0.14.1[${PYTHON_USEDEP}] <dev-python/huggingface-hub-1.0[${PYTHON_USEDEP}] )
	torchhub? ( dev-python/importlib-metadata[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/ipadic-1.0.0[${PYTHON_USEDEP}] <dev-python/ipadic-2.0[${PYTHON_USEDEP}] )
	ja? ( >=dev-python/ipadic-1.0.0[${PYTHON_USEDEP}] <dev-python/ipadic-2.0[${PYTHON_USEDEP}] )
	dev-tensorflow? ( >=dev-python/isort-5.5.4[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/isort-5.5.4[${PYTHON_USEDEP}] )
	quality? ( >=dev-python/isort-5.5.4[${PYTHON_USEDEP}] )
	all? ( >=dev-python/jax-0.2.8[${PYTHON_USEDEP}] <=dev-python/jax-0.3.6[${PYTHON_USEDEP}] !~dev-python/jax-0.3.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/jax-0.2.8[${PYTHON_USEDEP}] <=dev-python/jax-0.3.6[${PYTHON_USEDEP}] !~dev-python/jax-0.3.2[${PYTHON_USEDEP}] )
	flax? ( >=dev-python/jax-0.2.8[${PYTHON_USEDEP}] <=dev-python/jax-0.3.6[${PYTHON_USEDEP}] !~dev-python/jax-0.3.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/jaxlib-0.1.65[${PYTHON_USEDEP}] <=dev-python/jaxlib-0.3.6[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/jaxlib-0.1.65[${PYTHON_USEDEP}] <=dev-python/jaxlib-0.3.6[${PYTHON_USEDEP}] )
	flax? ( >=dev-python/jaxlib-0.1.65[${PYTHON_USEDEP}] <=dev-python/jaxlib-0.3.6[${PYTHON_USEDEP}] )
	all? ( dev-python/kenlm[${PYTHON_USEDEP}] )
	audio? ( dev-python/kenlm[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/kenlm[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/kenlm[${PYTHON_USEDEP}] )
	docs? ( dev-python/kenlm[${PYTHON_USEDEP}] )
	flax-speech? ( dev-python/kenlm[${PYTHON_USEDEP}] )
	speech? ( dev-python/kenlm[${PYTHON_USEDEP}] )
	tf-speech? ( dev-python/kenlm[${PYTHON_USEDEP}] )
	torch-speech? ( dev-python/kenlm[${PYTHON_USEDEP}] )
	all? ( >=dev-python/keras-nlp-0.3.1[${PYTHON_USEDEP}] )
	dev-tensorflow? ( >=dev-python/keras-nlp-0.3.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/keras-nlp-0.3.1[${PYTHON_USEDEP}] )
	tf-cpu? ( >=dev-python/keras-nlp-0.3.1[${PYTHON_USEDEP}] )
	tf? ( >=dev-python/keras-nlp-0.3.1[${PYTHON_USEDEP}] )
	all? ( dev-python/librosa[${PYTHON_USEDEP}] )
	audio? ( dev-python/librosa[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/librosa[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/librosa[${PYTHON_USEDEP}] )
	docs? ( dev-python/librosa[${PYTHON_USEDEP}] )
	flax-speech? ( dev-python/librosa[${PYTHON_USEDEP}] )
	speech? ( dev-python/librosa[${PYTHON_USEDEP}] )
	tf-speech? ( dev-python/librosa[${PYTHON_USEDEP}] )
	torch-speech? ( dev-python/librosa[${PYTHON_USEDEP}] )
	natten? ( >=dev-python/natten-0.14.6[${PYTHON_USEDEP}] )
	deepspeed-testing? ( dev-python/nltk[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/nltk[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/nltk[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.17[${PYTHON_USEDEP}]
	torchhub? ( >=dev-python/numpy-1.17[${PYTHON_USEDEP}] )
	all? ( dev-python/onnxconverter-common[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/onnxconverter-common[${PYTHON_USEDEP}] )
	docs? ( dev-python/onnxconverter-common[${PYTHON_USEDEP}] )
	onnx? ( dev-python/onnxconverter-common[${PYTHON_USEDEP}] )
	tf-cpu? ( dev-python/onnxconverter-common[${PYTHON_USEDEP}] )
	tf? ( dev-python/onnxconverter-common[${PYTHON_USEDEP}] )
	dev-tensorflow? ( >=dev-python/onnxruntime-1.4.0[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/onnxruntime-1.4.0[${PYTHON_USEDEP}] )
	onnx? ( >=dev-python/onnxruntime-1.4.0[${PYTHON_USEDEP}] )
	onnxruntime? ( >=dev-python/onnxruntime-1.4.0[${PYTHON_USEDEP}] )
	dev-tensorflow? ( >=dev-python/onnxruntime-tools-1.4.2[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/onnxruntime-tools-1.4.2[${PYTHON_USEDEP}] )
	onnx? ( >=dev-python/onnxruntime-tools-1.4.2[${PYTHON_USEDEP}] )
	onnxruntime? ( >=dev-python/onnxruntime-tools-1.4.2[${PYTHON_USEDEP}] )
	agents? ( dev-python/opencv-python[${PYTHON_USEDEP}] )
	all? ( >=dev-python/optax-0.0.8[${PYTHON_USEDEP}] <=dev-python/optax-0.1.4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/optax-0.0.8[${PYTHON_USEDEP}] <=dev-python/optax-0.1.4[${PYTHON_USEDEP}] )
	flax? ( >=dev-python/optax-0.0.8[${PYTHON_USEDEP}] <=dev-python/optax-0.1.4[${PYTHON_USEDEP}] )
	all? ( dev-python/optuna[${PYTHON_USEDEP}] )
	deepspeed-testing? ( dev-python/optuna[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/optuna[${PYTHON_USEDEP}] )
	docs? ( dev-python/optuna[${PYTHON_USEDEP}] )
	integrations? ( dev-python/optuna[${PYTHON_USEDEP}] )
	optuna? ( dev-python/optuna[${PYTHON_USEDEP}] )
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	torchhub? ( >=dev-python/packaging-20.0[${PYTHON_USEDEP}] )
	deepspeed-testing? ( dev-python/parameterized[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/parameterized[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/parameterized[${PYTHON_USEDEP}] )
	all? ( dev-python/phonemizer[${PYTHON_USEDEP}] )
	audio? ( dev-python/phonemizer[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/phonemizer[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/phonemizer[${PYTHON_USEDEP}] )
	docs? ( dev-python/phonemizer[${PYTHON_USEDEP}] )
	flax-speech? ( dev-python/phonemizer[${PYTHON_USEDEP}] )
	speech? ( dev-python/phonemizer[${PYTHON_USEDEP}] )
	tf-speech? ( dev-python/phonemizer[${PYTHON_USEDEP}] )
	torch-speech? ( dev-python/phonemizer[${PYTHON_USEDEP}] )
	agents? ( dev-python/pillow[${PYTHON_USEDEP}] )
	all? ( dev-python/pillow[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/pillow[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/pillow[${PYTHON_USEDEP}] )
	docs? ( dev-python/pillow[${PYTHON_USEDEP}] )
	torch-vision? ( dev-python/pillow[${PYTHON_USEDEP}] )
	vision? ( dev-python/pillow[${PYTHON_USEDEP}] )
	all? ( <=dev-python/protobuf-3.20.3[${PYTHON_USEDEP}] )
	deepspeed-testing? ( <=dev-python/protobuf-3.20.3[${PYTHON_USEDEP}] )
	dev-tensorflow? ( <=dev-python/protobuf-3.20.3[${PYTHON_USEDEP}] )
	dev-torch? ( <=dev-python/protobuf-3.20.3[${PYTHON_USEDEP}] )
	docs? ( <=dev-python/protobuf-3.20.3[${PYTHON_USEDEP}] )
	sentencepiece? ( <=dev-python/protobuf-3.20.3[${PYTHON_USEDEP}] )
	torchhub? ( <=dev-python/protobuf-3.20.3[${PYTHON_USEDEP}] )
	deepspeed-testing? ( dev-python/psutil[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/psutil[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/psutil[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pyctcdecode-0.4.0[${PYTHON_USEDEP}] )
	audio? ( >=dev-python/pyctcdecode-0.4.0[${PYTHON_USEDEP}] )
	dev-tensorflow? ( >=dev-python/pyctcdecode-0.4.0[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/pyctcdecode-0.4.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pyctcdecode-0.4.0[${PYTHON_USEDEP}] )
	flax-speech? ( >=dev-python/pyctcdecode-0.4.0[${PYTHON_USEDEP}] )
	speech? ( >=dev-python/pyctcdecode-0.4.0[${PYTHON_USEDEP}] )
	tf-speech? ( >=dev-python/pyctcdecode-0.4.0[${PYTHON_USEDEP}] )
	torch-speech? ( >=dev-python/pyctcdecode-0.4.0[${PYTHON_USEDEP}] )
	serving? ( dev-python/pydantic[${PYTHON_USEDEP}] )
	deepspeed-testing? ( >=dev-python/pytest-7.2.0[${PYTHON_USEDEP}] )
	dev-tensorflow? ( >=dev-python/pytest-7.2.0[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/pytest-7.2.0[${PYTHON_USEDEP}] )
	deepspeed-testing? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	deepspeed-testing? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	all? ( dev-python/ray[tune,${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/ray[tune,${PYTHON_USEDEP}] )
	docs? ( dev-python/ray[tune,${PYTHON_USEDEP}] )
	integrations? ( dev-python/ray[tune,${PYTHON_USEDEP}] )
	ray? ( dev-python/ray[tune,${PYTHON_USEDEP}] )
	!~dev-python/regex-2019.12.17[${PYTHON_USEDEP}]
	torchhub? ( !~dev-python/regex-2019.12.17[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	torchhub? ( dev-python/requests[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/rhoknp-1.1.0[${PYTHON_USEDEP}] <dev-python/rhoknp-1.3.1[${PYTHON_USEDEP}] )
	ja? ( >=dev-python/rhoknp-1.1.0[${PYTHON_USEDEP}] <dev-python/rhoknp-1.3.1[${PYTHON_USEDEP}] )
	deepspeed-testing? ( dev-python/rjieba[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/rjieba[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/rjieba[${PYTHON_USEDEP}] )
	deepspeed-testing? ( !~dev-python/rouge-score-0.0.7[${PYTHON_USEDEP}] !~dev-python/rouge-score-0.0.8[${PYTHON_USEDEP}] !~dev-python/rouge-score-0.1[${PYTHON_USEDEP}] !~dev-python/rouge-score-0.1.1[${PYTHON_USEDEP}] )
	dev-tensorflow? ( !~dev-python/rouge-score-0.0.7[${PYTHON_USEDEP}] !~dev-python/rouge-score-0.0.8[${PYTHON_USEDEP}] !~dev-python/rouge-score-0.1[${PYTHON_USEDEP}] !~dev-python/rouge-score-0.1.1[${PYTHON_USEDEP}] )
	dev-torch? ( !~dev-python/rouge-score-0.0.7[${PYTHON_USEDEP}] !~dev-python/rouge-score-0.0.8[${PYTHON_USEDEP}] !~dev-python/rouge-score-0.1[${PYTHON_USEDEP}] !~dev-python/rouge-score-0.1.1[${PYTHON_USEDEP}] )
	dev-tensorflow? ( >=dev-python/ruff-0.0.241[${PYTHON_USEDEP}] <=dev-python/ruff-0.0.259[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/ruff-0.0.241[${PYTHON_USEDEP}] <=dev-python/ruff-0.0.259[${PYTHON_USEDEP}] )
	quality? ( >=dev-python/ruff-0.0.241[${PYTHON_USEDEP}] <=dev-python/ruff-0.0.259[${PYTHON_USEDEP}] )
	deepspeed-testing? ( >=dev-python/sacrebleu-1.4.12[${PYTHON_USEDEP}] <dev-python/sacrebleu-2.0.0[${PYTHON_USEDEP}] )
	dev-tensorflow? ( >=dev-python/sacrebleu-1.4.12[${PYTHON_USEDEP}] <dev-python/sacrebleu-2.0.0[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/sacrebleu-1.4.12[${PYTHON_USEDEP}] <dev-python/sacrebleu-2.0.0[${PYTHON_USEDEP}] )
	deepspeed-testing? ( dev-python/sacremoses[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/sacremoses[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/sacremoses[${PYTHON_USEDEP}] )
	>=dev-python/safetensors-0.3.1[${PYTHON_USEDEP}]
	sagemaker? ( >=dev-python/sagemaker-2.31.0[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	sklearn? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	agents? ( >=dev-python/sentencepiece-0.1.91[${PYTHON_USEDEP}] !~dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sentencepiece-0.1.91[${PYTHON_USEDEP}] !~dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}] )
	deepspeed-testing? ( >=dev-python/sentencepiece-0.1.91[${PYTHON_USEDEP}] !~dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}] )
	dev-tensorflow? ( >=dev-python/sentencepiece-0.1.91[${PYTHON_USEDEP}] !~dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/sentencepiece-0.1.91[${PYTHON_USEDEP}] !~dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sentencepiece-0.1.91[${PYTHON_USEDEP}] !~dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}] )
	sentencepiece? ( >=dev-python/sentencepiece-0.1.91[${PYTHON_USEDEP}] !~dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}] )
	torchhub? ( >=dev-python/sentencepiece-0.1.91[${PYTHON_USEDEP}] !~dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}] )
	all? ( dev-python/sigopt[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/sigopt[${PYTHON_USEDEP}] )
	docs? ( dev-python/sigopt[${PYTHON_USEDEP}] )
	integrations? ( dev-python/sigopt[${PYTHON_USEDEP}] )
	sigopt? ( dev-python/sigopt[${PYTHON_USEDEP}] )
	serving? ( dev-python/starlette[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/sudachidict-core-20220729[${PYTHON_USEDEP}] )
	ja? ( >=dev-python/sudachidict-core-20220729[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/sudachipy-0.6.6[${PYTHON_USEDEP}] )
	ja? ( >=dev-python/sudachipy-0.6.6[${PYTHON_USEDEP}] )
	all? ( >=dev-python/tensorflow-2.4[${PYTHON_USEDEP}] <dev-python/tensorflow-2.13[${PYTHON_USEDEP}] )
	dev-tensorflow? ( >=dev-python/tensorflow-2.4[${PYTHON_USEDEP}] <dev-python/tensorflow-2.13[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/tensorflow-2.4[${PYTHON_USEDEP}] <dev-python/tensorflow-2.13[${PYTHON_USEDEP}] )
	tf? ( >=dev-python/tensorflow-2.4[${PYTHON_USEDEP}] <dev-python/tensorflow-2.13[${PYTHON_USEDEP}] )
	tf-cpu? ( >=dev-python/tensorflow-cpu-2.4[${PYTHON_USEDEP}] <dev-python/tensorflow-cpu-2.13[${PYTHON_USEDEP}] )
	all? ( <dev-python/tensorflow-text-2.13[${PYTHON_USEDEP}] )
	dev-tensorflow? ( <dev-python/tensorflow-text-2.13[${PYTHON_USEDEP}] )
	docs? ( <dev-python/tensorflow-text-2.13[${PYTHON_USEDEP}] )
	tf-cpu? ( <dev-python/tensorflow-text-2.13[${PYTHON_USEDEP}] )
	tf? ( <dev-python/tensorflow-text-2.13[${PYTHON_USEDEP}] )
	all? ( dev-python/tf2onnx[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/tf2onnx[${PYTHON_USEDEP}] )
	docs? ( dev-python/tf2onnx[${PYTHON_USEDEP}] )
	onnx? ( dev-python/tf2onnx[${PYTHON_USEDEP}] )
	tf-cpu? ( dev-python/tf2onnx[${PYTHON_USEDEP}] )
	tf? ( dev-python/tf2onnx[${PYTHON_USEDEP}] )
	deepspeed-testing? ( dev-python/timeout-decorator[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/timeout-decorator[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/timeout-decorator[${PYTHON_USEDEP}] )
	all? ( dev-python/timm[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/timm[${PYTHON_USEDEP}] )
	docs? ( dev-python/timm[${PYTHON_USEDEP}] )
	timm? ( dev-python/timm[${PYTHON_USEDEP}] )
	agents? ( >=dev-python/torch-1.9[${PYTHON_USEDEP}] !~dev-python/torch-1.12.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/torch-1.9[${PYTHON_USEDEP}] !~dev-python/torch-1.12.0[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/torch-1.9[${PYTHON_USEDEP}] !~dev-python/torch-1.12.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/torch-1.9[${PYTHON_USEDEP}] !~dev-python/torch-1.12.0[${PYTHON_USEDEP}] )
	torch? ( >=dev-python/torch-1.9[${PYTHON_USEDEP}] !~dev-python/torch-1.12.0[${PYTHON_USEDEP}] )
	torchhub? ( >=dev-python/torch-1.9[${PYTHON_USEDEP}] !~dev-python/torch-1.12.0[${PYTHON_USEDEP}] )
	all? ( dev-python/torchaudio[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/torchaudio[${PYTHON_USEDEP}] )
	docs? ( dev-python/torchaudio[${PYTHON_USEDEP}] )
	speech? ( dev-python/torchaudio[${PYTHON_USEDEP}] )
	torch-speech? ( dev-python/torchaudio[${PYTHON_USEDEP}] )
	all? ( dev-python/torchvision[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/torchvision[${PYTHON_USEDEP}] )
	docs? ( dev-python/torchvision[${PYTHON_USEDEP}] )
	torch-vision? ( dev-python/torchvision[${PYTHON_USEDEP}] )
	>=dev-python/tqdm-4.27[${PYTHON_USEDEP}]
	torchhub? ( >=dev-python/tqdm-4.27[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/unidic-1.0.2[${PYTHON_USEDEP}] )
	ja? ( >=dev-python/unidic-1.0.2[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/unidic-lite-1.0.7[${PYTHON_USEDEP}] )
	ja? ( >=dev-python/unidic-lite-1.0.7[${PYTHON_USEDEP}] )
	dev-tensorflow? ( <dev-python/urllib3-2.0.0[${PYTHON_USEDEP}] )
	dev-torch? ( <dev-python/urllib3-2.0.0[${PYTHON_USEDEP}] )
	quality? ( <dev-python/urllib3-2.0.0[${PYTHON_USEDEP}] )
	serving? ( dev-python/uvicorn[${PYTHON_USEDEP}] )
	>=sci-libs/tokenizers-0.11.1[${PYTHON_USEDEP}] <sci-libs/tokenizers-0.14[${PYTHON_USEDEP}] !~sci-libs/tokenizers-0.11.3[${PYTHON_USEDEP}]
	all? ( >=sci-libs/tokenizers-0.11.1[${PYTHON_USEDEP}] <sci-libs/tokenizers-0.14[${PYTHON_USEDEP}] !~sci-libs/tokenizers-0.11.3[${PYTHON_USEDEP}] )
	dev-tensorflow? ( >=sci-libs/tokenizers-0.11.1[${PYTHON_USEDEP}] <sci-libs/tokenizers-0.14[${PYTHON_USEDEP}] !~sci-libs/tokenizers-0.11.3[${PYTHON_USEDEP}] )
	dev-torch? ( >=sci-libs/tokenizers-0.11.1[${PYTHON_USEDEP}] <sci-libs/tokenizers-0.14[${PYTHON_USEDEP}] !~sci-libs/tokenizers-0.11.3[${PYTHON_USEDEP}] )
	docs? ( >=sci-libs/tokenizers-0.11.1[${PYTHON_USEDEP}] <sci-libs/tokenizers-0.14[${PYTHON_USEDEP}] !~sci-libs/tokenizers-0.11.3[${PYTHON_USEDEP}] )
	tokenizers? ( >=sci-libs/tokenizers-0.11.1[${PYTHON_USEDEP}] <sci-libs/tokenizers-0.14[${PYTHON_USEDEP}] !~sci-libs/tokenizers-0.11.3[${PYTHON_USEDEP}] )
	torchhub? ( >=sci-libs/tokenizers-0.11.1[${PYTHON_USEDEP}] <sci-libs/tokenizers-0.14[${PYTHON_USEDEP}] !~sci-libs/tokenizers-0.11.3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/accelerate-0.20.2[${PYTHON_USEDEP}]
		~dev-python/av-9.2.0[${PYTHON_USEDEP}]
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		>=dev-python/black-23.1[${PYTHON_USEDEP}] =dev-python/black-23*[${PYTHON_USEDEP}]
		~dev-python/codecarbon-1.2.0[${PYTHON_USEDEP}]
		~dev-python/cookiecutter-1.7.3[${PYTHON_USEDEP}]
		!~dev-python/datasets-2.5.0[${PYTHON_USEDEP}]
		~dev-python/decord-0.6.0[${PYTHON_USEDEP}]
		<dev-python/dill-0.3.5[${PYTHON_USEDEP}]
		>=dev-python/evaluate-0.2.0[${PYTHON_USEDEP}]
		dev-python/faiss-cpu[${PYTHON_USEDEP}]
		>=dev-python/flax-0.4.1[${PYTHON_USEDEP}] <=dev-python/flax-0.6.9[${PYTHON_USEDEP}]
		>=dev-python/fugashi-1.0[${PYTHON_USEDEP}]
		<dev-python/gitpython-3.1.19[${PYTHON_USEDEP}]
		>=dev-python/hf-doc-builder-0.3.0[${PYTHON_USEDEP}]
		dev-python/hf-doc-builder[${PYTHON_USEDEP}]
		>=dev-python/ipadic-1.0.0[${PYTHON_USEDEP}] <dev-python/ipadic-2.0[${PYTHON_USEDEP}]
		>=dev-python/isort-5.5.4[${PYTHON_USEDEP}]
		>=dev-python/jax-0.2.8[${PYTHON_USEDEP}] <=dev-python/jax-0.3.6[${PYTHON_USEDEP}] !~dev-python/jax-0.3.2[${PYTHON_USEDEP}]
		>=dev-python/jaxlib-0.1.65[${PYTHON_USEDEP}] <=dev-python/jaxlib-0.3.6[${PYTHON_USEDEP}]
		dev-python/kenlm[${PYTHON_USEDEP}]
		>=dev-python/keras-nlp-0.3.1[${PYTHON_USEDEP}]
		dev-python/librosa[${PYTHON_USEDEP}]
		dev-python/nltk[${PYTHON_USEDEP}]
		dev-python/onnxconverter-common[${PYTHON_USEDEP}]
		>=dev-python/optax-0.0.8[${PYTHON_USEDEP}] <=dev-python/optax-0.1.4[${PYTHON_USEDEP}]
		dev-python/optuna[${PYTHON_USEDEP}]
		dev-python/parameterized[${PYTHON_USEDEP}]
		dev-python/phonemizer[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		<=dev-python/protobuf-3.20.3[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		>=dev-python/pyctcdecode-0.4.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.2.0[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/ray[tune,${PYTHON_USEDEP}]
		>=dev-python/rhoknp-1.1.0[${PYTHON_USEDEP}] <dev-python/rhoknp-1.3.1[${PYTHON_USEDEP}]
		dev-python/rjieba[${PYTHON_USEDEP}]
		!~dev-python/rouge-score-0.0.7[${PYTHON_USEDEP}] !~dev-python/rouge-score-0.0.8[${PYTHON_USEDEP}] !~dev-python/rouge-score-0.1[${PYTHON_USEDEP}] !~dev-python/rouge-score-0.1.1[${PYTHON_USEDEP}]
		>=dev-python/ruff-0.0.241[${PYTHON_USEDEP}] <=dev-python/ruff-0.0.259[${PYTHON_USEDEP}]
		>=dev-python/sacrebleu-1.4.12[${PYTHON_USEDEP}] <dev-python/sacrebleu-2.0.0[${PYTHON_USEDEP}]
		dev-python/sacremoses[${PYTHON_USEDEP}]
		dev-python/scikit-learn[${PYTHON_USEDEP}]
		>=dev-python/sentencepiece-0.1.91[${PYTHON_USEDEP}] !~dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}]
		dev-python/sigopt[${PYTHON_USEDEP}]
		>=dev-python/sudachidict-core-20220729[${PYTHON_USEDEP}]
		>=dev-python/sudachipy-0.6.6[${PYTHON_USEDEP}]
		>=dev-python/tensorflow-2.4[${PYTHON_USEDEP}] <dev-python/tensorflow-2.13[${PYTHON_USEDEP}]
		<dev-python/tensorflow-text-2.13[${PYTHON_USEDEP}]
		dev-python/tf2onnx[${PYTHON_USEDEP}]
		dev-python/timeout-decorator[${PYTHON_USEDEP}]
		dev-python/timm[${PYTHON_USEDEP}]
		>=dev-python/torch-1.9[${PYTHON_USEDEP}] !~dev-python/torch-1.12.0[${PYTHON_USEDEP}]
		dev-python/torchaudio[${PYTHON_USEDEP}]
		dev-python/torchvision[${PYTHON_USEDEP}]
		>=dev-python/unidic-1.0.2[${PYTHON_USEDEP}]
		>=dev-python/unidic-lite-1.0.7[${PYTHON_USEDEP}]
		<dev-python/urllib3-2.0.0[${PYTHON_USEDEP}]
		>=sci-libs/tokenizers-0.11.1[${PYTHON_USEDEP}] <sci-libs/tokenizers-0.14[${PYTHON_USEDEP}] !~sci-libs/tokenizers-0.11.3[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
