# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all-extras all-extras-pandas2 binder cython-extras dataframe datasets dev docs forecasting mlflow mlflow-tests numpy1 pandas1 tests"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sktime/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	<dev-python/arch-7.1.0[${PYTHON_USEDEP}]
	<dev-python/arch-7.1.0[${PYTHON_USEDEP}]
	<dev-python/arch-7.1[${PYTHON_USEDEP}]
	<dev-python/autots-0.7[${PYTHON_USEDEP}]
	<dev-python/autots-0.7[${PYTHON_USEDEP}]
	all-extras? ( <dev-python/autots-0.7[${PYTHON_USEDEP}] )
	dev? ( dev-python/backoff[${PYTHON_USEDEP}] )
	mlflow-tests? ( dev-python/boto3[${PYTHON_USEDEP}] )
	mlflow-tests? ( dev-python/botocore[${PYTHON_USEDEP}] )
	dev-python/catboost[${PYTHON_USEDEP}]
	dev-python/cloudpickle[${PYTHON_USEDEP}]
	dev-python/cloudpickle[${PYTHON_USEDEP}]
	!=dev-python/dash-2.9.0[${PYTHON_USEDEP}]
	!=dev-python/dash-2.9.0[${PYTHON_USEDEP}]
	dataframe? ( <dev-python/dask-2024.11.3[${PYTHON_USEDEP}] )
	dataframe? ( <dev-python/dask-2024.8.1[${PYTHON_USEDEP}] )
	<dev-python/dtaidistance-2.4[${PYTHON_USEDEP}]
	<dev-python/dtaidistance-2.4[${PYTHON_USEDEP}]
	<dev-python/dtaidistance-2.4[${PYTHON_USEDEP}]
	<dev-python/dtw-python-1.6[${PYTHON_USEDEP}]
	dev-python/dtw-python[${PYTHON_USEDEP}]
	dev-python/dtw-python[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>dev-python/einops-0.7.0[${PYTHON_USEDEP}]' python3_12)
	<dev-python/filterpy-1.5[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/freia[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/gluonts-0.14.3[${PYTHON_USEDEP}]' python3_12)
	>=dev-python/gluonts-0.9[${PYTHON_USEDEP}]
	>=dev-python/gluonts-0.9[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/h5py[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep 'dev-python/h5py[${PYTHON_USEDEP}]' python3_12)
	<dev-python/hmmlearn-0.4[${PYTHON_USEDEP}]
	<dev-python/hmmlearn-0.4[${PYTHON_USEDEP}]
	<dev-python/holidays-0.59[${PYTHON_USEDEP}]
	dev-python/holidays[${PYTHON_USEDEP}]
	dev-python/holidays[${PYTHON_USEDEP}]
	dev? ( dev-python/httpx[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep '>=dev-python/huggingface-hub-0.23.0[${PYTHON_USEDEP}]' python3_12)
	dev-python/hydra-core[${PYTHON_USEDEP}]
	<dev-python/joblib-1.5[${PYTHON_USEDEP}]
	binder? ( dev-python/jupyter[${PYTHON_USEDEP}] )
	docs? ( dev-python/jupyter[${PYTHON_USEDEP}] )
	<dev-python/keras-self-attention-0.52[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/lightning-2.0[${PYTHON_USEDEP}]' python3_12)
	!=dev-python/matplotlib-3.9.1[${PYTHON_USEDEP}]
	!=dev-python/matplotlib-3.9.1[${PYTHON_USEDEP}]
	mlflow-tests? ( dev-python/mlflow[${PYTHON_USEDEP}] )
	mlflow? ( dev-python/mlflow[${PYTHON_USEDEP}] )
	<dev-python/mne-1.9[${PYTHON_USEDEP}]
	dev-python/mne[${PYTHON_USEDEP}]
	dev-python/mne[${PYTHON_USEDEP}]
	mlflow-tests? ( dev-python/moto[${PYTHON_USEDEP}] )
	cython-extras? ( <dev-python/mrseql-0.0.3[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/nbsphinx-0.8.6[${PYTHON_USEDEP}] )
	<dev-python/numba-0.61[${PYTHON_USEDEP}]
	<dev-python/numba-0.61[${PYTHON_USEDEP}]
	<dev-python/numba-0.61[${PYTHON_USEDEP}]
	<dev-python/numba-0.61[${PYTHON_USEDEP}]
	<dev-python/numba-0.61[${PYTHON_USEDEP}]
	<dev-python/numba-0.61[${PYTHON_USEDEP}]
	<dev-python/numba-0.61[${PYTHON_USEDEP}]
	<dev-python/numba-0.61[${PYTHON_USEDEP}]
	<dev-python/numba-0.61[${PYTHON_USEDEP}]
	cython-extras? ( <dev-python/numba-0.61[${PYTHON_USEDEP}] )
	<dev-python/numpy-2.2[${PYTHON_USEDEP}]
	numpy1? ( <dev-python/numpy-2.0.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	all-extras-pandas2? ( <dev-python/optuna-4.2[${PYTHON_USEDEP}] )
	all-extras? ( <dev-python/optuna-4.2[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	<dev-python/pandas-2.3.0[${PYTHON_USEDEP}]
	binder? ( <dev-python/pandas-2.0.0[${PYTHON_USEDEP}] )
	pandas1? ( <dev-python/pandas-2.0.0[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep '<dev-python/peft-0.14.0[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '!=dev-python/pmdarima-1.8.1[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '!=dev-python/pmdarima-1.8.1[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '!=dev-python/pmdarima-1.8.1[${PYTHON_USEDEP}]' python3_12)
	<dev-python/polars-2.0[pandas,${PYTHON_USEDEP}]
	<dev-python/polars-2.0[pandas,${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/prophet-1.1[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/prophet-1.1[${PYTHON_USEDEP}]' python3_12)
	<dev-python/prophet-1.2[${PYTHON_USEDEP}]
	<dev-python/pycatch22-0.4.6[${PYTHON_USEDEP}]
	<dev-python/pycatch22-0.4.6[${PYTHON_USEDEP}]
	<dev-python/pycatch22-0.4.6[${PYTHON_USEDEP}]
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep '<dev-python/pyod-1.2[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '<dev-python/pyod-1.2[${PYTHON_USEDEP}]' python3_12)
	dev? ( dev-python/pytest[${PYTHON_USEDEP}] )
	tests? ( <dev-python/pytest-8.4[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-randomly[${PYTHON_USEDEP}] )
	tests? ( <dev-python/pytest-randomly-3.17[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	tests? ( <dev-python/pytest-timeout-2.4[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	tests? ( <dev-python/pytest-xdist-3.7[${PYTHON_USEDEP}] )
	<dev-python/pytorch-forecasting-1.2.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '<dev-python/pyts-0.14.0[${PYTHON_USEDEP}]' python3_12)
	datasets? ( dev-python/rdata[${PYTHON_USEDEP}] )
	datasets? ( dev-python/requests[${PYTHON_USEDEP}] )
	<dev-python/scikit-base-0.13.0[${PYTHON_USEDEP}]
	<dev-python/scikit-learn-1.6.0[${PYTHON_USEDEP}]
	dev-python/scikit-optimize[${PYTHON_USEDEP}]
	>=dev-python/scikit-posthocs-0.6.5[${PYTHON_USEDEP}]
	>=dev-python/scikit-posthocs-0.6.5[${PYTHON_USEDEP}]
	<dev-python/scipy-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/seaborn-0.11[${PYTHON_USEDEP}]
	>=dev-python/seaborn-0.11[${PYTHON_USEDEP}]
	<dev-python/seasonal-0.4[${PYTHON_USEDEP}]
	dev-python/seasonal[${PYTHON_USEDEP}]
	dev-python/seasonal[${PYTHON_USEDEP}]
	binder? ( dev-python/skchange[${PYTHON_USEDEP}] )
	<dev-python/skforecast-0.14[${PYTHON_USEDEP}]
	<dev-python/skforecast-0.14[${PYTHON_USEDEP}]
	<dev-python/skforecast-0.14[${PYTHON_USEDEP}]
	all-extras-pandas2? ( <dev-python/skpro-2.9.0[${PYTHON_USEDEP}] )
	all-extras? ( <dev-python/skpro-2.9.0[${PYTHON_USEDEP}] )
	forecasting? ( <dev-python/skpro-2.9.0[${PYTHON_USEDEP}] )
	docs? ( !=dev-python/sphinx-7.2.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-design-0.7.0[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-gallery-0.19.0[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-issues-6.0.0[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep '<dev-python/statsforecast-1.8.0[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '<dev-python/statsforecast-1.8.0[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '<dev-python/statsforecast-1.8.0[${PYTHON_USEDEP}]' python3_12)
	<dev-python/statsmodels-0.15[${PYTHON_USEDEP}]
	<dev-python/statsmodels-0.15[${PYTHON_USEDEP}]
	<dev-python/statsmodels-0.15[${PYTHON_USEDEP}]
	>=dev-python/statsmodels-0.12.1[${PYTHON_USEDEP}]
	>=dev-python/statsmodels-0.12.1[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '<dev-python/stumpy-1.13[${PYTHON_USEDEP}]' python3_12)
	docs? ( dev-python/tabulate[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep '<dev-python/tbats-1.2[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/tbats-1.1[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/tbats-1.1[${PYTHON_USEDEP}]' python3_12)
	!=dev-python/temporian-0.8.0[${PYTHON_USEDEP}]
	!=dev-python/temporian-0.8.0[${PYTHON_USEDEP}]
	!=dev-python/temporian-0.8.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '<dev-python/tensorflow-2.17[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '<dev-python/tensorflow-2.17[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '<dev-python/tensorflow-2.17[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '<dev-python/tensorflow-2.17[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '<dev-python/tensorflow-2.17[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '<dev-python/tensorflow-2.17[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep 'dev-python/torch[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '<dev-python/transformers-4.41.0[torch,${PYTHON_USEDEP}]' python3_12)
	<dev-python/tsbootstrap-0.2[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '<dev-python/tsfresh-0.21[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '<dev-python/tsfresh-0.21[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/tsfresh-0.17[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/tsfresh-0.17[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '!=dev-python/tslearn-0.6.0[${PYTHON_USEDEP}]' python3_12)
	<dev-python/u8darts-0.32.0[${PYTHON_USEDEP}]
	<dev-python/u8darts-0.32.0[${PYTHON_USEDEP}]
	dev? ( dev-python/wheel[${PYTHON_USEDEP}] )
	dev-python/xarray[${PYTHON_USEDEP}]
	dev-python/xarray[${PYTHON_USEDEP}]
	dev? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest