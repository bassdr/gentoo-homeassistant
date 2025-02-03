# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="1bit-mpi all autotuning autotuning-ml inf readthedocs sd sparse sparse-attn triton"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/deepspeed/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	all? ( dev-python/accelerate[${PYTHON_USEDEP}] )
	all? ( >=dev-python/autodoc-pydantic-2.0.0[${PYTHON_USEDEP}] )
	readthedocs? ( >=dev-python/autodoc-pydantic-2.0.0[${PYTHON_USEDEP}] )
	all? ( =dev-python/clang-format-18.1.3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/comet-ml-3.41.0[${PYTHON_USEDEP}] )
	dev-python/deepspeed-kernels[${PYTHON_USEDEP}]
	all? ( >=dev-python/diffusers-0.25.0[${PYTHON_USEDEP}] )
	sd? ( >=dev-python/diffusers-0.25.0[${PYTHON_USEDEP}] )
	all? ( <dev-python/docutils-0.18[${PYTHON_USEDEP}] )
	readthedocs? ( <dev-python/docutils-0.18[${PYTHON_USEDEP}] )
	dev-python/einops[${PYTHON_USEDEP}]
	all? ( dev-python/future[${PYTHON_USEDEP}] )
	all? ( dev-python/google[${PYTHON_USEDEP}] )
	inf? ( dev-python/google[${PYTHON_USEDEP}] )
	all? ( dev-python/hjson[${PYTHON_USEDEP}] )
	autotuning-ml? ( dev-python/hjson[${PYTHON_USEDEP}] )
	dev-python/hjson[${PYTHON_USEDEP}]
	readthedocs? ( dev-python/hjson[${PYTHON_USEDEP}] )
	all? ( >=dev-python/importlib-metadata-4[${PYTHON_USEDEP}] )
	all? ( =dev-python/lm-eval-0.3.0[${PYTHON_USEDEP}] )
	inf? ( =dev-python/lm-eval-0.3.0[${PYTHON_USEDEP}] )
	1bit-mpi? ( dev-python/mpi4py[${PYTHON_USEDEP}] )
	all? ( dev-python/mpi4py[${PYTHON_USEDEP}] )
	dev-python/msgpack[${PYTHON_USEDEP}]
	all? ( dev-python/mup[${PYTHON_USEDEP}] )
	all? ( =dev-python/neural-compressor-2.1.0[${PYTHON_USEDEP}] )
	sparse? ( =dev-python/neural-compressor-2.1.0[${PYTHON_USEDEP}] )
	dev-python/ninja[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	all? ( dev-python/packaging[${PYTHON_USEDEP}] )
	readthedocs? ( dev-python/packaging[${PYTHON_USEDEP}] )
	all? ( dev-python/protobuf[${PYTHON_USEDEP}] )
	inf? ( dev-python/protobuf[${PYTHON_USEDEP}] )
	all? ( dev-python/psutil[${PYTHON_USEDEP}] )
	dev-python/psutil[${PYTHON_USEDEP}]
	readthedocs? ( dev-python/psutil[${PYTHON_USEDEP}] )
	all? ( dev-python/py-cpuinfo[${PYTHON_USEDEP}] )
	dev-python/py-cpuinfo[${PYTHON_USEDEP}]
	readthedocs? ( dev-python/py-cpuinfo[${PYTHON_USEDEP}] )
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}] )
	readthedocs? ( >=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-7.2.0[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-forked[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-randomly[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	all? ( =dev-python/qtorch-0.3.0[${PYTHON_USEDEP}] )
	all? ( dev-python/qtorch[${PYTHON_USEDEP}] )
	inf? ( dev-python/qtorch[${PYTHON_USEDEP}] )
	all? ( dev-python/recommonmark[${PYTHON_USEDEP}] )
	readthedocs? ( dev-python/recommonmark[${PYTHON_USEDEP}] )
	all? ( dev-python/safetensors[${PYTHON_USEDEP}] )
	inf? ( dev-python/safetensors[${PYTHON_USEDEP}] )
	all? ( dev-python/sentencepiece[${PYTHON_USEDEP}] )
	inf? ( dev-python/sentencepiece[${PYTHON_USEDEP}] )
	all? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	all? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	readthedocs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	all? ( dev-python/tabulate[${PYTHON_USEDEP}] )
	autotuning-ml? ( dev-python/tabulate[${PYTHON_USEDEP}] )
	autotuning? ( dev-python/tabulate[${PYTHON_USEDEP}] )
	all? ( dev-python/tensorboard[${PYTHON_USEDEP}] )
	all? ( dev-python/torch[${PYTHON_USEDEP}] )
	dev-python/torch[${PYTHON_USEDEP}]
	readthedocs? ( dev-python/torch[${PYTHON_USEDEP}] )
	all? ( dev-python/torchvision[${PYTHON_USEDEP}] )
	all? ( dev-python/tqdm[${PYTHON_USEDEP}] )
	dev-python/tqdm[${PYTHON_USEDEP}]
	readthedocs? ( dev-python/tqdm[${PYTHON_USEDEP}] )
	all? ( >=dev-python/transformers-4.32.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/transformers-4.39.0[${PYTHON_USEDEP}] )
	inf? ( >=dev-python/transformers-4.32.1[${PYTHON_USEDEP}] )
	all? ( =dev-python/triton-1.0.0[${PYTHON_USEDEP}] )
	all? ( =dev-python/triton-2.1.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/triton-2.1.0[${PYTHON_USEDEP}] )
	sd? ( >=dev-python/triton-2.1.0[${PYTHON_USEDEP}] )
	sparse-attn? ( =dev-python/triton-1.0.0[${PYTHON_USEDEP}] )
	triton? ( =dev-python/triton-2.1.0[${PYTHON_USEDEP}] )
	all? ( dev-python/wandb[${PYTHON_USEDEP}] )
	all? ( dev-python/xgboost[${PYTHON_USEDEP}] )
	autotuning-ml? ( dev-python/xgboost[${PYTHON_USEDEP}] )
	all? ( >=dev-vcs/pre-commit-3.2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/accelerate[${PYTHON_USEDEP}]
		=dev-python/clang-format-18.1.3[${PYTHON_USEDEP}]
		>=dev-python/comet-ml-3.41.0[${PYTHON_USEDEP}]
		<dev-python/docutils-0.18[${PYTHON_USEDEP}]
		dev-python/future[${PYTHON_USEDEP}]
		>=dev-python/importlib-metadata-4[${PYTHON_USEDEP}]
		dev-python/mup[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.2.0[${PYTHON_USEDEP}]
		dev-python/pytest-forked[${PYTHON_USEDEP}]
		dev-python/pytest-randomly[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		=dev-python/qtorch-0.3.0[${PYTHON_USEDEP}]
		dev-python/recommonmark[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}]
		dev-python/tensorboard[${PYTHON_USEDEP}]
		dev-python/torchvision[${PYTHON_USEDEP}]
		>=dev-python/transformers-4.39.0[${PYTHON_USEDEP}]
		dev-python/wandb[${PYTHON_USEDEP}]
		>=dev-vcs/pre-commit-3.2.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
