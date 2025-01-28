# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all-extras dev docs"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tsbootstrap/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	all-extras? ( <dev-python/arch-7.1.0[${PYTHON_USEDEP}] )
	dev? ( dev-python/autoflake[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/black-24.3.0[${PYTHON_USEDEP}] )
	dev? ( dev-python/blacken-docs[${PYTHON_USEDEP}] )
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	dev? ( dev-python/github-actions[${PYTHON_USEDEP}] )
	all-extras? ( <dev-python/hmmlearn-0.3.2[${PYTHON_USEDEP}] )
	dev? ( dev-python/hypothesis[${PYTHON_USEDEP}] )
	dev? ( dev-python/importlib-metadata[${PYTHON_USEDEP}] )
	docs? ( dev-python/jupyter[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/nbsphinx-0.8.6[${PYTHON_USEDEP}] )
	<dev-python/numpy-1.27[${PYTHON_USEDEP}]
	docs? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	<dev-python/packaging-24.2[${PYTHON_USEDEP}]
	dev? ( dev-python/pip-tools[${PYTHON_USEDEP}] )
	all-extras? ( <dev-python/pyclustering-0.11.0[${PYTHON_USEDEP}] )
	dev? ( dev-python/pycobertura[${PYTHON_USEDEP}] )
	<dev-python/pydantic-3.0[${PYTHON_USEDEP}]
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	dev? ( dev-python/pyright[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	dev? ( dev-python/ruff[${PYTHON_USEDEP}] )
	<dev-python/scikit-base-0.11[${PYTHON_USEDEP}]
	<dev-python/scikit-learn-1.6.0[${PYTHON_USEDEP}]
	all-extras? ( <dev-python/scikit-learn-extra-0.4.0[${PYTHON_USEDEP}] )
	<dev-python/scipy-1.14.0[${PYTHON_USEDEP}]
	docs? ( !=dev-python/sphinx-7.2.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-copybutton-0.5.2[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-design-0.6.0[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-gallery-0.15.0[${PYTHON_USEDEP}] )
	docs? ( <dev-python/sphinx-issues-4.0.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.3.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-version-warning[${PYTHON_USEDEP}] )
	all-extras? ( <dev-python/statsmodels-0.15.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/tabulate-0.9.0[${PYTHON_USEDEP}] )
	dev? ( dev-python/tomlkit[${PYTHON_USEDEP}] )
	dev? ( dev-python/tox[${PYTHON_USEDEP}] )
	dev? ( dev-python/tox-gh-actions[${PYTHON_USEDEP}] )
	dev? ( dev-python/typos[${PYTHON_USEDEP}] )
	dev? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest