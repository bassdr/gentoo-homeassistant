# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all fastai huggingface image lgbm lightning markdown mmcv optuna plots sklearn tf xgb"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dvclive/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	huggingface? ( dev-python/datasets[${PYTHON_USEDEP}] )
	>=dev-python/dvc-3.48.4[${PYTHON_USEDEP}]
	<dev-python/dvc-render-2[${PYTHON_USEDEP}]
	<dev-python/dvc-studio-client-1[${PYTHON_USEDEP}]
	all? ( dev-python/dvclive[fastai,huggingface,image,lgbm,lightning,markdown,mmcv,optuna,plots,tf,xgb,${PYTHON_USEDEP}] )
	fastai? ( dev-python/fastai[${PYTHON_USEDEP}] )
	dev-python/funcy[${PYTHON_USEDEP}]
	dev-python/gto[${PYTHON_USEDEP}]
	lightning? ( >=dev-python/jsonargparse-4.26.1[signatures,${PYTHON_USEDEP}] )
	lgbm? ( dev-python/lightgbm[${PYTHON_USEDEP}] )
	lightning? ( >=dev-python/lightning-2.0[${PYTHON_USEDEP}] )
	markdown? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	mmcv? ( dev-python/mmcv[${PYTHON_USEDEP}] )
	image? ( dev-python/numpy[${PYTHON_USEDEP}] )
	plots? ( dev-python/numpy[${PYTHON_USEDEP}] )
	optuna? ( dev-python/optuna[${PYTHON_USEDEP}] )
	plots? ( dev-python/pandas[${PYTHON_USEDEP}] )
	image? ( dev-python/pillow[${PYTHON_USEDEP}] )
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/pynvml[${PYTHON_USEDEP}]
	dev-python/ruamel-yaml[${PYTHON_USEDEP}]
	plots? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	sklearn? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	<dev-python/scmrepo-4[${PYTHON_USEDEP}]
	tf? ( dev-python/tensorflow[${PYTHON_USEDEP}] )
	lightning? ( dev-python/torch[${PYTHON_USEDEP}] )
	huggingface? ( dev-python/transformers[${PYTHON_USEDEP}] )
	xgb? ( dev-python/xgboost[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/dpath[${PYTHON_USEDEP}]
	dev-python/dvclive[all,tests,${PYTHON_USEDEP}]
	dev-python/dvclive[image,markdown,plots,${PYTHON_USEDEP}]
	dev-python/ipython[${PYTHON_USEDEP}]
	~dev-python/mypy-1.13.0[${PYTHON_USEDEP}]
	<dev-python/pytest-9.0[${PYTHON_USEDEP}]
	<dev-python/pytest-cov-6.0[${PYTHON_USEDEP}]
	<dev-python/pytest-mock-4.0[${PYTHON_USEDEP}]
	<dev-python/pytest-sugar-2.0[${PYTHON_USEDEP}]
	dev-python/pytest-voluptuous[${PYTHON_USEDEP}]
	dev-python/tf-keras[${PYTHON_USEDEP}]
	dev-python/transformers[torch,${PYTHON_USEDEP}]
	dev-python/types-pyyaml[${PYTHON_USEDEP}]
)"
