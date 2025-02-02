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

GENERATED_DEPEND="${RDEPEND}
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
	deepspeed-testing? ( ~dev-python/black-23.1[${PYTHON_USEDEP}] )
	dev-tensorflow? ( ~dev-python/black-23.1[${PYTHON_USEDEP}] )
	dev-torch? ( ~dev-python/black-23.1[${PYTHON_USEDEP}] )
	quality? ( ~dev-python/black-23.1[${PYTHON_USEDEP}] )
	all? ( ~dev-python/codecarbon-1.2.0[${PYTHON_USEDEP}] )
	codecarbon? ( ~dev-python/codecarbon-1.2.0[${PYTHON_USEDEP}] )
	dev-torch? ( ~dev-python/codecarbon-1.2.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/codecarbon-1.2.0[${PYTHON_USEDEP}] )
	deepspeed-testing? ( ~dev-python/cookiecutter-1.7.3[${PYTHON_USEDEP}] )
	dev-tensorflow? ( ~dev-python/cookiecutter-1.7.3[${PYTHON_USEDEP}] )
	dev-torch? ( ~dev-python/cookiecutter-1.7.3[${PYTHON_USEDEP}] )
	modelcreation? ( ~dev-python/cookiecutter-1.7.3[${PYTHON_USEDEP}] )
	agents? ( !=dev-python/datasets-2.5.0[${PYTHON_USEDEP}] )
	deepspeed-testing? ( !=dev-python/datasets-2.5.0[${PYTHON_USEDEP}] )
	dev-tensorflow? ( !=dev-python/datasets-2.5.0[${PYTHON_USEDEP}] )
	dev-torch? ( !=dev-python/datasets-2.5.0[${PYTHON_USEDEP}] )
	quality? ( !=dev-python/datasets-2.5.0[${PYTHON_USEDEP}] )
	retrieval? ( !=dev-python/datasets-2.5.0[${PYTHON_USEDEP}] )
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
	all? ( <=dev-python/flax-0.6.9[${PYTHON_USEDEP}] )
	docs? ( <=dev-python/flax-0.6.9[${PYTHON_USEDEP}] )
	flax? ( <=dev-python/flax-0.6.9[${PYTHON_USEDEP}] )
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
	<dev-python/huggingface-hub-1.0[${PYTHON_USEDEP}]
	torchhub? ( <dev-python/huggingface-hub-1.0[${PYTHON_USEDEP}] )
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	torchhub? ( dev-python/importlib-metadata[${PYTHON_USEDEP}] )
	dev-torch? ( <dev-python/ipadic-2.0[${PYTHON_USEDEP}] )
	ja? ( <dev-python/ipadic-2.0[${PYTHON_USEDEP}] )
	dev-tensorflow? ( >=dev-python/isort-5.5.4[${PYTHON_USEDEP}] )
	dev-torch? ( >=dev-python/isort-5.5.4[${PYTHON_USEDEP}] )
	quality? ( >=dev-python/isort-5.5.4[${PYTHON_USEDEP}] )
	all? ( !=dev-python/jax-0.3.2[${PYTHON_USEDEP}] )
	docs? ( !=dev-python/jax-0.3.2[${PYTHON_USEDEP}] )
	flax? ( !=dev-python/jax-0.3.2[${PYTHON_USEDEP}] )
	all? ( <=dev-python/jaxlib-0.3.6[${PYTHON_USEDEP}] )
	docs? ( <=dev-python/jaxlib-0.3.6[${PYTHON_USEDEP}] )
	flax? ( <=dev-python/jaxlib-0.3.6[${PYTHON_USEDEP}] )
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
	all? ( <=dev-python/optax-0.1.4[${PYTHON_USEDEP}] )
	docs? ( <=dev-python/optax-0.1.4[${PYTHON_USEDEP}] )
	flax? ( <=dev-python/optax-0.1.4[${PYTHON_USEDEP}] )
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
	!=dev-python/regex-2019.12.17[${PYTHON_USEDEP}]
	torchhub? ( !=dev-python/regex-2019.12.17[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	torchhub? ( dev-python/requests[${PYTHON_USEDEP}] )
	dev-torch? ( <dev-python/rhoknp-1.3.1[${PYTHON_USEDEP}] )
	ja? ( <dev-python/rhoknp-1.3.1[${PYTHON_USEDEP}] )
	deepspeed-testing? ( dev-python/rjieba[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/rjieba[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/rjieba[${PYTHON_USEDEP}] )
	deepspeed-testing? ( !=dev-python/rouge-score-0.0.7[${PYTHON_USEDEP}] )
	dev-tensorflow? ( !=dev-python/rouge-score-0.0.7[${PYTHON_USEDEP}] )
	dev-torch? ( !=dev-python/rouge-score-0.0.7[${PYTHON_USEDEP}] )
	dev-tensorflow? ( <=dev-python/ruff-0.0.259[${PYTHON_USEDEP}] )
	dev-torch? ( <=dev-python/ruff-0.0.259[${PYTHON_USEDEP}] )
	quality? ( <=dev-python/ruff-0.0.259[${PYTHON_USEDEP}] )
	deepspeed-testing? ( <dev-python/sacrebleu-2.0.0[${PYTHON_USEDEP}] )
	dev-tensorflow? ( <dev-python/sacrebleu-2.0.0[${PYTHON_USEDEP}] )
	dev-torch? ( <dev-python/sacrebleu-2.0.0[${PYTHON_USEDEP}] )
	deepspeed-testing? ( dev-python/sacremoses[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/sacremoses[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/sacremoses[${PYTHON_USEDEP}] )
	>=dev-python/safetensors-0.3.1[${PYTHON_USEDEP}]
	sagemaker? ( >=dev-python/sagemaker-2.31.0[${PYTHON_USEDEP}] )
	dev-tensorflow? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	dev-torch? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	sklearn? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	agents? ( !=dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}] )
	all? ( !=dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}] )
	deepspeed-testing? ( !=dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}] )
	dev-tensorflow? ( !=dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}] )
	dev-torch? ( !=dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}] )
	docs? ( !=dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}] )
	sentencepiece? ( !=dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}] )
	torchhub? ( !=dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}] )
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
	all? ( <dev-python/tensorflow-2.13[${PYTHON_USEDEP}] )
	dev-tensorflow? ( <dev-python/tensorflow-2.13[${PYTHON_USEDEP}] )
	docs? ( <dev-python/tensorflow-2.13[${PYTHON_USEDEP}] )
	tf? ( <dev-python/tensorflow-2.13[${PYTHON_USEDEP}] )
	tf-cpu? ( <dev-python/tensorflow-cpu-2.13[${PYTHON_USEDEP}] )
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
	agents? ( !=dev-python/torch-1.12.0[${PYTHON_USEDEP}] )
	all? ( !=dev-python/torch-1.12.0[${PYTHON_USEDEP}] )
	dev-torch? ( !=dev-python/torch-1.12.0[${PYTHON_USEDEP}] )
	docs? ( !=dev-python/torch-1.12.0[${PYTHON_USEDEP}] )
	torch? ( !=dev-python/torch-1.12.0[${PYTHON_USEDEP}] )
	torchhub? ( !=dev-python/torch-1.12.0[${PYTHON_USEDEP}] )
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
	!=sci-libs/tokenizers-0.11.3[${PYTHON_USEDEP}]
	all? ( !=sci-libs/tokenizers-0.11.3[${PYTHON_USEDEP}] )
	dev-tensorflow? ( !=sci-libs/tokenizers-0.11.3[${PYTHON_USEDEP}] )
	dev-torch? ( !=sci-libs/tokenizers-0.11.3[${PYTHON_USEDEP}] )
	docs? ( !=sci-libs/tokenizers-0.11.3[${PYTHON_USEDEP}] )
	tokenizers? ( !=sci-libs/tokenizers-0.11.3[${PYTHON_USEDEP}] )
	torchhub? ( !=sci-libs/tokenizers-0.11.3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/accelerate-0.20.2[${PYTHON_USEDEP}]
	~dev-python/av-9.2.0[${PYTHON_USEDEP}]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	~dev-python/black-23.1[${PYTHON_USEDEP}]
	~dev-python/codecarbon-1.2.0[${PYTHON_USEDEP}]
	~dev-python/cookiecutter-1.7.3[${PYTHON_USEDEP}]
	!=dev-python/datasets-2.5.0[${PYTHON_USEDEP}]
	~dev-python/decord-0.6.0[${PYTHON_USEDEP}]
	<dev-python/dill-0.3.5[${PYTHON_USEDEP}]
	>=dev-python/evaluate-0.2.0[${PYTHON_USEDEP}]
	dev-python/faiss-cpu[${PYTHON_USEDEP}]
	<=dev-python/flax-0.6.9[${PYTHON_USEDEP}]
	>=dev-python/fugashi-1.0[${PYTHON_USEDEP}]
	<dev-python/gitpython-3.1.19[${PYTHON_USEDEP}]
	>=dev-python/hf-doc-builder-0.3.0[${PYTHON_USEDEP}]
	<dev-python/ipadic-2.0[${PYTHON_USEDEP}]
	>=dev-python/isort-5.5.4[${PYTHON_USEDEP}]
	!=dev-python/jax-0.3.2[${PYTHON_USEDEP}]
	<=dev-python/jaxlib-0.3.6[${PYTHON_USEDEP}]
	dev-python/kenlm[${PYTHON_USEDEP}]
	>=dev-python/keras-nlp-0.3.1[${PYTHON_USEDEP}]
	dev-python/librosa[${PYTHON_USEDEP}]
	dev-python/nltk[${PYTHON_USEDEP}]
	dev-python/onnxconverter-common[${PYTHON_USEDEP}]
	<=dev-python/optax-0.1.4[${PYTHON_USEDEP}]
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
	<dev-python/rhoknp-1.3.1[${PYTHON_USEDEP}]
	dev-python/rjieba[${PYTHON_USEDEP}]
	!=dev-python/rouge-score-0.0.7[${PYTHON_USEDEP}]
	<=dev-python/ruff-0.0.259[${PYTHON_USEDEP}]
	<dev-python/sacrebleu-2.0.0[${PYTHON_USEDEP}]
	dev-python/sacremoses[${PYTHON_USEDEP}]
	dev-python/scikit-learn[${PYTHON_USEDEP}]
	!=dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}]
	dev-python/sigopt[${PYTHON_USEDEP}]
	>=dev-python/sudachidict-core-20220729[${PYTHON_USEDEP}]
	>=dev-python/sudachipy-0.6.6[${PYTHON_USEDEP}]
	<dev-python/tensorflow-2.13[${PYTHON_USEDEP}]
	<dev-python/tensorflow-text-2.13[${PYTHON_USEDEP}]
	dev-python/tf2onnx[${PYTHON_USEDEP}]
	dev-python/timeout-decorator[${PYTHON_USEDEP}]
	dev-python/timm[${PYTHON_USEDEP}]
	!=dev-python/torch-1.12.0[${PYTHON_USEDEP}]
	dev-python/torchaudio[${PYTHON_USEDEP}]
	dev-python/torchvision[${PYTHON_USEDEP}]
	>=dev-python/unidic-1.0.2[${PYTHON_USEDEP}]
	>=dev-python/unidic-lite-1.0.7[${PYTHON_USEDEP}]
	<dev-python/urllib3-2.0.0[${PYTHON_USEDEP}]
	!=sci-libs/tokenizers-0.11.3[${PYTHON_USEDEP}]
)"
