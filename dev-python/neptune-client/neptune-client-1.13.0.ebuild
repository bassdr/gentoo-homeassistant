# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="airflow aws detectron2 fastai lightgbm mlflow mosaicml optuna prophet pytorch pytorch-lightning sacred sklearn tensorboard tensorflow-keras transformers xgboost zenml"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/neptune-client/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	GitPython>=2.0.8
	Pillow>=1.1.6
	PyJWT
	boto3>=1.28.0
	bravado<12.0.0,>=11.0.0
	click>=7.0
	future>=0.17.1
	importlib-metadata; python_version < '3.8'
	kedro-neptune; python_version < '3.11' and extra == 'kedro'
	mosaicml; extra == 'mosaicml'
	neptune-airflow; extra == 'airflow'
	neptune-aws; extra == 'aws'
	neptune-detectron2; python_version >= '3.8' and extra == 'detectron2'
	neptune-fastai; extra == 'fastai'
	neptune-lightgbm; extra == 'lightgbm'
	neptune-mlflow; extra == 'mlflow'
	neptune-optuna; extra == 'optuna'
	neptune-prophet; extra == 'prophet'
	neptune-pytorch; extra == 'pytorch'
	neptune-sacred; extra == 'sacred'
	neptune-sklearn; extra == 'sklearn'
	neptune-tensorboard; extra == 'tensorboard'
	neptune-tensorflow-keras; extra == 'tensorflow-keras'
	neptune-xgboost; extra == 'xgboost'
	oauthlib>=2.1.0
	packaging
	pandas
	psutil
	pytorch-lightning; extra == 'pytorch-lightning'
	requests-oauthlib>=1.0.0
	requests>=2.20.0
	six>=1.12.0
	swagger-spec-validator>=2.7.4
	transformers; extra == 'transformers'
	typing-extensions>=3.10.0
	urllib3
	websocket-client!=1.0.0,>=0.35.0
	zenml; extra == 'zenml'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/boto3-1.28.0[${PYTHON_USEDEP}]
	>=dev-python/bravado-11.0.0[${PYTHON_USEDEP}] <dev-python/bravado-12.0.0[${PYTHON_USEDEP}]
	>=dev-python/click-7.0[${PYTHON_USEDEP}]
	>=dev-python/future-0.17.1[${PYTHON_USEDEP}]
	>=dev-python/gitpython-2.0.8[${PYTHON_USEDEP}]
	mosaicml? ( dev-python/mosaicml[${PYTHON_USEDEP}] )
	airflow? ( dev-python/neptune-airflow[${PYTHON_USEDEP}] )
	aws? ( dev-python/neptune-aws[${PYTHON_USEDEP}] )
	detectron2? ( dev-python/neptune-detectron2[${PYTHON_USEDEP}] )
	fastai? ( dev-python/neptune-fastai[${PYTHON_USEDEP}] )
	lightgbm? ( dev-python/neptune-lightgbm[${PYTHON_USEDEP}] )
	mlflow? ( dev-python/neptune-mlflow[${PYTHON_USEDEP}] )
	optuna? ( dev-python/neptune-optuna[${PYTHON_USEDEP}] )
	prophet? ( dev-python/neptune-prophet[${PYTHON_USEDEP}] )
	pytorch? ( dev-python/neptune-pytorch[${PYTHON_USEDEP}] )
	sacred? ( dev-python/neptune-sacred[${PYTHON_USEDEP}] )
	sklearn? ( dev-python/neptune-sklearn[${PYTHON_USEDEP}] )
	tensorboard? ( dev-python/neptune-tensorboard[${PYTHON_USEDEP}] )
	tensorflow-keras? ( dev-python/neptune-tensorflow-keras[${PYTHON_USEDEP}] )
	xgboost? ( dev-python/neptune-xgboost[${PYTHON_USEDEP}] )
	>=dev-python/oauthlib-2.1.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	>=dev-python/pillow-1.1.6[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/pyjwt[${PYTHON_USEDEP}]
	pytorch-lightning? ( dev-python/pytorch-lightning[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.12.0[${PYTHON_USEDEP}]
	>=dev-python/swagger-spec-validator-2.7.4[${PYTHON_USEDEP}]
	transformers? ( dev-python/transformers[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-3.10.0[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.35.0[${PYTHON_USEDEP}] !~dev-python/websocket-client-1.0.0[${PYTHON_USEDEP}]
	zenml? ( dev-python/zenml[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
