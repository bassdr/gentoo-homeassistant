# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all comet cv deepspeed ml mlflow neptune onnx onnx-gpu optuna profiler wandb"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/catalyst/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/accelerate-0.5.1[${PYTHON_USEDEP}]
	comet? ( dev-python/comet-ml[${PYTHON_USEDEP}] )
	deepspeed? ( >=dev-python/deepspeed-0.4.0[${PYTHON_USEDEP}] )
	>=dev-python/hydra-slayer-0.4.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/imageio-2.5.0[${PYTHON_USEDEP}] )
	cv? ( >=dev-python/imageio-2.5.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/matplotlib-3.1.0[${PYTHON_USEDEP}] )
	ml? ( >=dev-python/matplotlib-3.1.0[${PYTHON_USEDEP}] )
	mlflow? ( dev-python/mlflow[${PYTHON_USEDEP}] )
	neptune? ( >=dev-python/neptune-client-0.9.8[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.18[${PYTHON_USEDEP}]
	onnx-gpu? ( dev-python/onnx[${PYTHON_USEDEP}] )
	onnx? ( dev-python/onnx[${PYTHON_USEDEP}] )
	onnx? ( dev-python/onnxruntime[${PYTHON_USEDEP}] )
	onnx-gpu? ( dev-python/onnxruntime-gpu[${PYTHON_USEDEP}] )
	all? ( >=dev-python/opencv-python-headless-4.2.0.32[${PYTHON_USEDEP}] )
	cv? ( >=dev-python/opencv-python-headless-4.2.0.32[${PYTHON_USEDEP}] )
	all? ( >=dev-python/optuna-2.0.0[${PYTHON_USEDEP}] )
	optuna? ( >=dev-python/optuna-2.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pandas-1.0.0[${PYTHON_USEDEP}] )
	ml? ( >=dev-python/pandas-1.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pillow-6.1[${PYTHON_USEDEP}] )
	cv? ( >=dev-python/pillow-6.1[${PYTHON_USEDEP}] )
	all? ( dev-python/requests[${PYTHON_USEDEP}] )
	cv? ( dev-python/requests[${PYTHON_USEDEP}] )
	all? ( >=dev-python/scikit-image-0.16.1[${PYTHON_USEDEP}] <dev-python/scikit-image-0.19.0[${PYTHON_USEDEP}] )
	cv? ( >=dev-python/scikit-image-0.16.1[${PYTHON_USEDEP}] <dev-python/scikit-image-0.19.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/scikit-learn-1.0[${PYTHON_USEDEP}] )
	ml? ( >=dev-python/scikit-learn-1.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/scipy-1.4.1[${PYTHON_USEDEP}] )
	ml? ( >=dev-python/scipy-1.4.1[${PYTHON_USEDEP}] )
	>=dev-python/tensorboardx-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/torch-1.4.0[${PYTHON_USEDEP}]
	profiler? ( dev-python/torch-tb-profiler[${PYTHON_USEDEP}] )
	all? ( >=dev-python/torchvision-0.5.0[${PYTHON_USEDEP}] )
	cv? ( >=dev-python/torchvision-0.5.0[${PYTHON_USEDEP}] )
	>=dev-python/tqdm-4.33.0[${PYTHON_USEDEP}]
	wandb? ( dev-python/wandb[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		=dev-python/black-21.8_beta0[${PYTHON_USEDEP}]
		=dev-python/catalyst-codestyle-21.09.2[${PYTHON_USEDEP}]
		=dev-python/catalyst-sphinx-theme-1.2.0[${PYTHON_USEDEP}]
		<=dev-python/click-8.0.4[${PYTHON_USEDEP}]
		=dev-python/docutils-0.17.1[${PYTHON_USEDEP}]
		<=dev-python/jinja2-3.0.3[${PYTHON_USEDEP}]
		=dev-python/mock-3.0.5[${PYTHON_USEDEP}]
		dev-python/path[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		=dev-python/sphinx-2.2.1[${PYTHON_USEDEP}]
		=dev-python/tomlkit-0.7.2[${PYTHON_USEDEP}]
		=dev-vcs/pre-commit-2.13.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
