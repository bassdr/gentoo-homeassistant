# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all-extras dev docs github-actions graph mqf2 tuning"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytorch-forecasting/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev? ( dev-python/black[jupyter,${PYTHON_USEDEP}] )
	dev? ( dev-python/coverage[${PYTHON_USEDEP}] )
	all-extras? ( dev-python/cpflows[${PYTHON_USEDEP}] )
	mqf2? ( dev-python/cpflows[${PYTHON_USEDEP}] )
	docs? ( dev-python/docutils[${PYTHON_USEDEP}] )
	dev? ( dev-python/invoke[${PYTHON_USEDEP}] )
	dev? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	dev? ( <dev-python/ipywidgets-9.0.0[${PYTHON_USEDEP}] )
	<dev-python/lightning-3.0.0[${PYTHON_USEDEP}]
	all-extras? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	dev? ( dev-python/mypy[${PYTHON_USEDEP}] )
	dev? ( dev-python/nbconvert[${PYTHON_USEDEP}] )
	docs? ( dev-python/nbconvert[${PYTHON_USEDEP}] )
	dev? ( dev-python/nbsphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/nbsphinx[${PYTHON_USEDEP}] )
	graph? ( dev-python/networkx[${PYTHON_USEDEP}] )
	<=dev-python/numpy-3.0.0[${PYTHON_USEDEP}]
	all-extras? ( <dev-python/optuna-5.0.0[${PYTHON_USEDEP}] )
	tuning? ( <dev-python/optuna-5.0.0[${PYTHON_USEDEP}] )
	all-extras? ( dev-python/optuna-integration[${PYTHON_USEDEP}] )
	tuning? ( dev-python/optuna-integration[${PYTHON_USEDEP}] )
	<dev-python/pandas-3.0.0[${PYTHON_USEDEP}]
	dev? ( <dev-python/pandoc-3.0.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/pandoc[${PYTHON_USEDEP}] )
	dev? ( dev-python/pyarrow[${PYTHON_USEDEP}] )
	dev? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	dev? ( <dev-python/pydocstyle-7.0.0[${PYTHON_USEDEP}] )
	dev? ( dev-python/pylint[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	dev? ( <dev-python/pytest-dotenv-1.0.0[${PYTHON_USEDEP}] )
	github-actions? ( dev-python/pytest-github-actions-annotate-failures[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-sugar[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	all-extras? ( <dev-python/pytorch-optimizer-4.0.0[${PYTHON_USEDEP}] )
	dev? ( dev-python/recommonmark[${PYTHON_USEDEP}] )
	docs? ( dev-python/recommonmark[${PYTHON_USEDEP}] )
	dev? ( dev-python/ruff[${PYTHON_USEDEP}] )
	<dev-python/scikit-learn-2.0[${PYTHON_USEDEP}]
	<dev-python/scipy-2.0[${PYTHON_USEDEP}]
	dev? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( >dev-python/sphinx-3.2[${PYTHON_USEDEP}] )
	all-extras? ( dev-python/statsmodels[${PYTHON_USEDEP}] )
	tuning? ( dev-python/statsmodels[${PYTHON_USEDEP}] )
	dev? ( <dev-python/tensorboard-3.0.0[${PYTHON_USEDEP}] )
	!=dev-python/torch-2.0.1[${PYTHON_USEDEP}]
	dev? ( <dev-vcs/pre-commit-5.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest