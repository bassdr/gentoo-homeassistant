# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="fugue test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dask-sql/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	black==22.10.0; extra == 'dev'
	dask[dataframe]>=2024.4.1
	distributed>=2024.4.1
	fastapi>=0.92.0
	fugue>=0.7.3; extra == 'fugue'
	httpx>=0.24.1
	intake>=0.6.0; extra == 'dev'
	isort==5.12.0; extra == 'dev'
	mock>=4.0.3; extra == 'dev'
	pandas>=1.4.0
	pre-commit; extra == 'dev'
	prompt_toolkit>=3.0.8
	pyarrow>=14.0.1; extra == 'dev'
	pygments>=2.7.1
	pytest-cov>=2.10.1; extra == 'dev'
	pytest>=6.0.1; extra == 'dev'
	scikit-learn>=1.0.0; extra == 'dev'
	sphinx>=3.2.1; extra == 'dev'
	tabulate
	triad<0.9.2; extra == 'fugue'
	tzlocal>=2.1
	uvicorn>=0.14
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/dask-2024.4.1[dataframe,${PYTHON_USEDEP}]
	>=dev-python/distributed-2024.4.1[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.92.0[${PYTHON_USEDEP}]
	fugue? ( >=dev-python/fugue-0.7.3[${PYTHON_USEDEP}] )
	>=dev-python/httpx-0.24.1[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.8[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.7.1[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	fugue? ( <dev-python/triad-0.9.2[${PYTHON_USEDEP}] )
	>=dev-python/tzlocal-2.1[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.14[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/black-22.10.0[${PYTHON_USEDEP}]
		>=dev-python/intake-0.6.0[${PYTHON_USEDEP}]
		~dev-python/isort-5.12.0[${PYTHON_USEDEP}]
		>=dev-python/mock-4.0.3[${PYTHON_USEDEP}]
		>=dev-python/pyarrow-14.0.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-2.10.1[${PYTHON_USEDEP}]
		>=dev-python/scikit-learn-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/sphinx-3.2.1[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
