# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="benchmark checking document optional test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/optuna/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/alembic-1.5.0[${PYTHON_USEDEP}]
	document? ( dev-python/ase[${PYTHON_USEDEP}] )
	benchmark? ( >=dev-python/asv-0.5.0[${PYTHON_USEDEP}] )
	checking? ( dev-python/black[${PYTHON_USEDEP}] )
	checking? ( dev-python/blackdoc[${PYTHON_USEDEP}] )
	optional? ( dev-python/boto3[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/cma[${PYTHON_USEDEP}] )
	document? ( >=dev-python/cmaes-0.10.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/cmaes-0.10.0[${PYTHON_USEDEP}] )
	dev-python/colorlog[${PYTHON_USEDEP}]
	test? ( dev-python/coverage[${PYTHON_USEDEP}] )
	test? ( dev-python/fakeredis[lua,${PYTHON_USEDEP}] )
	checking? ( dev-python/flake8[${PYTHON_USEDEP}] )
	document? ( dev-python/fvcore[${PYTHON_USEDEP}] )
	optional? ( dev-python/google-cloud-storage[${PYTHON_USEDEP}] )
	optional? ( dev-python/grpcio[${PYTHON_USEDEP}] )
	test? ( dev-python/grpcio[${PYTHON_USEDEP}] )
	checking? ( dev-python/isort[${PYTHON_USEDEP}] )
	document? ( <dev-python/kaleido-0.4[${PYTHON_USEDEP}] )
	test? ( <dev-python/kaleido-0.4[${PYTHON_USEDEP}] )
	document? ( dev-python/lightgbm[${PYTHON_USEDEP}] )
	document? ( !=dev-python/matplotlib-3.6.0[${PYTHON_USEDEP}] )
	optional? ( !=dev-python/matplotlib-3.6.0[${PYTHON_USEDEP}] )
	test? ( dev-python/moto[${PYTHON_USEDEP}] )
	checking? ( dev-python/mypy[${PYTHON_USEDEP}] )
	checking? ( dev-python/mypy-boto3-s3[${PYTHON_USEDEP}] )
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	document? ( dev-python/pandas[${PYTHON_USEDEP}] )
	optional? ( dev-python/pandas[${PYTHON_USEDEP}] )
	document? ( dev-python/pillow[${PYTHON_USEDEP}] )
	document? ( >=dev-python/plotly-4.9.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/plotly-4.9.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/protobuf-5.28.1[${PYTHON_USEDEP}] )
	test? ( >=dev-python/protobuf-5.28.1[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	optional? ( dev-python/redis[${PYTHON_USEDEP}] )
	document? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/scikit-learn-0.24.2[${PYTHON_USEDEP}] )
	optional? ( dev-python/scipy[${PYTHON_USEDEP}] )
	test? ( >=dev-python/scipy-1.9.2[${PYTHON_USEDEP}] )
	document? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	document? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	document? ( dev-python/sphinx-gallery[${PYTHON_USEDEP}] )
	document? ( dev-python/sphinx-notfound-page[${PYTHON_USEDEP}] )
	document? ( >=dev-python/sphinx-rtd-theme-1.2.0[${PYTHON_USEDEP}] )
	>=dev-python/sqlalchemy-1.4.2[${PYTHON_USEDEP}]
	document? ( dev-python/torch[${PYTHON_USEDEP}] )
	document? ( dev-python/torchvision[${PYTHON_USEDEP}] )
	dev-python/tqdm[${PYTHON_USEDEP}]
	checking? ( dev-python/types-pyyaml[${PYTHON_USEDEP}] )
	checking? ( dev-python/types-redis[${PYTHON_USEDEP}] )
	checking? ( dev-python/types-setuptools[${PYTHON_USEDEP}] )
	checking? ( dev-python/types-tqdm[${PYTHON_USEDEP}] )
	checking? ( >=dev-python/typing-extensions-3.10.0.0[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/virtualenv[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest