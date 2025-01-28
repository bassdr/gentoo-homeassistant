# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="allennlp botorch catboost chainer chainermn checking cma comet dask document fastai fastaiv2 keras lightgbm mlflow mxnet pytorch-distributed pytorch-ignite pytorch-lightning shap sklearn skorch tensorboard tensorflow test tfkeras wandb xgboost"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/optuna-integration/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	allennlp? ( dev-python/allennlp[${PYTHON_USEDEP}] )
	checking? ( dev-python/black[${PYTHON_USEDEP}] )
	checking? ( dev-python/blackdoc[${PYTHON_USEDEP}] )
	botorch? ( <dev-python/botorch-0.10.0[${PYTHON_USEDEP}] )
	catboost? ( dev-python/catboost[${PYTHON_USEDEP}] )
	chainer? ( dev-python/chainer[${PYTHON_USEDEP}] )
	chainermn? ( dev-python/chainermn[${PYTHON_USEDEP}] )
	cma? ( dev-python/cma[${PYTHON_USEDEP}] )
	comet? ( >=dev-python/comet-ml-3.39.3[${PYTHON_USEDEP}] )
	test? ( dev-python/coverage[${PYTHON_USEDEP}] )
	dask? ( dev-python/distributed[${PYTHON_USEDEP}] )
	test? ( dev-python/fakeredis[lua,${PYTHON_USEDEP}] )
	fastai? ( >=dev-python/fastai-2.0.0[${PYTHON_USEDEP}] )
	fastaiv2? ( >=dev-python/fastai-2.0.0[${PYTHON_USEDEP}] )
	pytorch-distributed? ( dev-python/gpytorch[${PYTHON_USEDEP}] )
	test? ( dev-python/grpcio[${PYTHON_USEDEP}] )
	checking? ( dev-python/hacking[${PYTHON_USEDEP}] )
	checking? ( dev-python/isort[${PYTHON_USEDEP}] )
	allennlp? ( dev-python/jsonnet[${PYTHON_USEDEP}] )
	lightgbm? ( dev-python/lightgbm[${PYTHON_USEDEP}] )
	pytorch-lightning? ( dev-python/lightning[${PYTHON_USEDEP}] )
	document? ( dev-python/mlflow[${PYTHON_USEDEP}] )
	mlflow? ( dev-python/mlflow[${PYTHON_USEDEP}] )
	mxnet? ( dev-python/mxnet[${PYTHON_USEDEP}] )
	checking? ( dev-python/mypy[${PYTHON_USEDEP}] )
	allennlp? ( <dev-python/numpy-2.0.0[${PYTHON_USEDEP}] )
	catboost? ( <dev-python/numpy-2.0.0[${PYTHON_USEDEP}] )
	chainer? ( <dev-python/numpy-2.0.0[${PYTHON_USEDEP}] )
	chainermn? ( <dev-python/numpy-2.0.0[${PYTHON_USEDEP}] )
	cma? ( <dev-python/numpy-2.0.0[${PYTHON_USEDEP}] )
	shap? ( <dev-python/numpy-2.0.0[${PYTHON_USEDEP}] )
	dev-python/optuna[${PYTHON_USEDEP}]
	document? ( dev-python/pandas[${PYTHON_USEDEP}] )
	sklearn? ( dev-python/pandas[${PYTHON_USEDEP}] )
	test? ( >=dev-python/protobuf-5.28.1[${PYTHON_USEDEP}] )
	allennlp? ( dev-python/psutil[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	pytorch-ignite? ( dev-python/pytorch-ignite[${PYTHON_USEDEP}] )
	document? ( >=dev-python/scikit-learn-0.24.2[${PYTHON_USEDEP}] )
	lightgbm? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	sklearn? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	sklearn? ( dev-python/scipy[${PYTHON_USEDEP}] )
	shap? ( dev-python/shap[${PYTHON_USEDEP}] )
	skorch? ( dev-python/skorch[${PYTHON_USEDEP}] )
	document? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	document? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	tensorboard? ( dev-python/tensorboard[${PYTHON_USEDEP}] )
	keras? ( dev-python/tensorflow[${PYTHON_USEDEP}] )
	tensorboard? ( dev-python/tensorflow[${PYTHON_USEDEP}] )
	tensorflow? ( <=dev-python/tensorflow-2.15.0[${PYTHON_USEDEP}] )
	tfkeras? ( dev-python/tensorflow[${PYTHON_USEDEP}] )
	checking? ( dev-python/types-pyyaml[${PYTHON_USEDEP}] )
	checking? ( dev-python/types-redis[${PYTHON_USEDEP}] )
	checking? ( dev-python/types-setuptools[${PYTHON_USEDEP}] )
	checking? ( >=dev-python/typing-extensions-3.10.0.0[${PYTHON_USEDEP}] )
	wandb? ( dev-python/wandb[${PYTHON_USEDEP}] )
	xgboost? ( dev-python/xgboost[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest