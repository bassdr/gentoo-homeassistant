# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs flax quality torch training"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/diffusers/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	torch? ( >=dev-python/accelerate-0.31.0[${PYTHON_USEDEP}] )
	training? ( >=dev-python/accelerate-0.31.0[${PYTHON_USEDEP}] )
	training? ( dev-python/datasets[${PYTHON_USEDEP}] )
	dev-python/filelock[${PYTHON_USEDEP}]
	flax? ( >=dev-python/flax-0.4.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/hf-doc-builder-0.3.0[${PYTHON_USEDEP}] )
	quality? ( >=dev-python/hf-doc-builder-0.3.0[${PYTHON_USEDEP}] )
	>=dev-python/huggingface-hub-0.23.2[${PYTHON_USEDEP}]
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	quality? ( >=dev-python/isort-5.5.4[${PYTHON_USEDEP}] )
	flax? ( >=dev-python/jax-0.4.1[${PYTHON_USEDEP}] )
	flax? ( >=dev-python/jaxlib-0.4.1[${PYTHON_USEDEP}] )
	training? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	dev-python/numpy[${PYTHON_USEDEP}]
	training? ( >=dev-python/peft-0.6.0[${PYTHON_USEDEP}] )
	dev-python/pillow[${PYTHON_USEDEP}]
	training? ( <dev-python/protobuf-4[${PYTHON_USEDEP}] )
	!=dev-python/regex-2019.12.17[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	quality? ( =dev-python/ruff-0.1.5[${PYTHON_USEDEP}] )
	>=dev-python/safetensors-0.3.1[${PYTHON_USEDEP}]
	training? ( dev-python/tensorboard[${PYTHON_USEDEP}] )
	torch? ( >=dev-python/torch-1.4[${PYTHON_USEDEP}] )
	quality? ( <=dev-python/urllib3-2.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/accelerate-0.31.0[${PYTHON_USEDEP}]
		=dev-python/compel-0.1.8[${PYTHON_USEDEP}]
		dev-python/datasets[${PYTHON_USEDEP}]
		>=dev-python/flax-0.4.1[${PYTHON_USEDEP}]
		<dev-python/gitpython-3.1.19[${PYTHON_USEDEP}]
		>=dev-python/hf-doc-builder-0.3.0[${PYTHON_USEDEP}]
		>=dev-python/invisible-watermark-0.2.0[${PYTHON_USEDEP}]
		>=dev-python/isort-5.5.4[${PYTHON_USEDEP}]
		>=dev-python/jax-0.4.1[${PYTHON_USEDEP}]
		>=dev-python/jaxlib-0.4.1[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		>=dev-python/k-diffusion-0.0.12[${PYTHON_USEDEP}]
		dev-python/librosa[${PYTHON_USEDEP}]
		dev-python/parameterized[${PYTHON_USEDEP}]
		>=dev-python/peft-0.6.0[${PYTHON_USEDEP}]
		<dev-python/protobuf-4[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		=dev-python/requests-mock-1.10.0[${PYTHON_USEDEP}]
		=dev-python/ruff-0.1.5[${PYTHON_USEDEP}]
		>=dev-python/safetensors-0.3.1[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		!=dev-python/sentencepiece-0.1.92[${PYTHON_USEDEP}]
		dev-python/tensorboard[${PYTHON_USEDEP}]
		>=dev-python/torch-1.4[${PYTHON_USEDEP}]
		dev-python/torchvision[${PYTHON_USEDEP}]
		>=dev-python/transformers-4.41.2[${PYTHON_USEDEP}]
		<=dev-python/urllib3-2.0.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
