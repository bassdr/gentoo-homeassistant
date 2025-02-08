# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="onnx onnx-gpu openvino train"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sentence-transformers/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Pillow
	accelerate>=0.20.3; extra == "dev"
	accelerate>=0.20.3; extra == "train"
	datasets; extra == "dev"
	datasets; extra == "train"
	huggingface-hub>=0.20.0
	optimum-intel[openvino]>=1.20.0; extra == "openvino"
	optimum[onnxruntime-gpu]>=1.23.1; extra == "onnx-gpu"
	optimum[onnxruntime]>=1.23.1; extra == "onnx"
	peft; extra == "dev"
	pre-commit; extra == "dev"
	pytest-cov; extra == "dev"
	pytest; extra == "dev"
	scikit-learn
	scipy
	torch>=1.11.0
	tqdm
	transformers<5.0.0,>=4.41.0
"
GENERATED_RDEPEND="${RDEPEND}
	train? ( >=dev-python/accelerate-0.20.3[${PYTHON_USEDEP}] )
	train? ( dev-python/datasets[${PYTHON_USEDEP}] )
	>=dev-python/huggingface-hub-0.20.0[${PYTHON_USEDEP}]
	onnx-gpu? ( >=dev-python/optimum-1.23.1[onnxruntime-gpu,${PYTHON_USEDEP}] )
	onnx? ( >=dev-python/optimum-1.23.1[onnxruntime,${PYTHON_USEDEP}] )
	openvino? ( >=dev-python/optimum-intel-1.20.0[openvino,${PYTHON_USEDEP}] )
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/scikit-learn[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	>=dev-python/torch-1.11.0[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	>=dev-python/transformers-4.41.0[${PYTHON_USEDEP}] <dev-python/transformers-5.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/accelerate-0.20.3[${PYTHON_USEDEP}]
		dev-python/datasets[${PYTHON_USEDEP}]
		dev-python/peft[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
