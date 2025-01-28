# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all benchmark docs jupyter test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/kedro/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	benchmark? ( dev-python/asv[${PYTHON_USEDEP}] )
	>=dev-python/attrs-21.3[${PYTHON_USEDEP}]
	test? ( ~dev-python/behave-1.2.6[${PYTHON_USEDEP}] )
	>=dev-python/build-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/cachetools-4.1[${PYTHON_USEDEP}]
	>=dev-python/click-4.0[${PYTHON_USEDEP}]
	<dev-python/cookiecutter-3.0[${PYTHON_USEDEP}]
	test? ( dev-python/coverage[toml,${PYTHON_USEDEP}] )
	<dev-python/dynaconf-4.0[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2021.4[${PYTHON_USEDEP}]
	>=dev-python/gitpython-3.0[${PYTHON_USEDEP}]
	test? ( ~dev-python/import-linter-2.1[${PYTHON_USEDEP}] )
	<dev-python/importlib-metadata-9.0[${PYTHON_USEDEP}]
	<dev-python/importlib-resources-7.0[${PYTHON_USEDEP}]
	docs? ( <dev-python/ipykernel-7.0[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/ipylab-1.0.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/ipylab-1.0.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/ipython-8.10[${PYTHON_USEDEP}] )
	docs? ( <dev-python/jinja2-3.2.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/jupyter-1.0[${PYTHON_USEDEP}] )
	test? ( <dev-python/jupyterlab-5[${PYTHON_USEDEP}] )
	test? ( >=dev-python/jupyterlab-server-2.11.1[${PYTHON_USEDEP}] )
	all? ( dev-python/kedro[benchmark,docs,jupyter,test,${PYTHON_USEDEP}] )
	test? ( dev-python/kedro-datasets[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/kedro-sphinx-theme-2024.10.2[${PYTHON_USEDEP}] )
	>=dev-python/kedro-telemetry-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/more-itertools-8.14.0[${PYTHON_USEDEP}]
	test? ( ~dev-python/mypy-1.0[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/notebook-7.0.0[${PYTHON_USEDEP}] )
	>=dev-python/omegaconf-2.1.1[${PYTHON_USEDEP}]
	test? ( ~dev-python/pandas-2.0[${PYTHON_USEDEP}] )
	test? ( dev-python/pandas-stubs[${PYTHON_USEDEP}] )
	>=dev-python/parse-1.19.0[${PYTHON_USEDEP}]
	>=dev-python/pluggy-1.0[${PYTHON_USEDEP}]
	test? ( >=dev-python/pluggy-1.0[${PYTHON_USEDEP}] )
	dev-python/pre-commit-hooks[${PYTHON_USEDEP}]
	test? ( <dev-python/pytest-9.0[${PYTHON_USEDEP}] )
	test? ( <dev-python/pytest-cov-7[${PYTHON_USEDEP}] )
	test? ( <dev-python/pytest-mock-4.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/pytest-xdist-2.2.1[psutil,${PYTHON_USEDEP}] )
	<dev-python/pyyaml-7.0[${PYTHON_USEDEP}]
	test? ( dev-python/requests-mock[${PYTHON_USEDEP}] )
	<dev-python/rich-14.0[${PYTHON_USEDEP}]
	<dev-python/rope-2.0[${PYTHON_USEDEP}]
	test? ( <dev-python/s3fs-2025.1[${PYTHON_USEDEP}] )
	docs? ( !=dev-python/sphinx-notfound-page-1.0.3[${PYTHON_USEDEP}] )
	>=dev-python/toml-0.10.0[${PYTHON_USEDEP}]
	test? ( ~dev-python/trufflehog-2.1[${PYTHON_USEDEP}] )
	test? ( dev-python/types-cachetools[${PYTHON_USEDEP}] )
	test? ( dev-python/types-pyyaml[${PYTHON_USEDEP}] )
	test? ( dev-python/types-requests[${PYTHON_USEDEP}] )
	test? ( dev-python/types-toml[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.0[${PYTHON_USEDEP}]
	test? ( <dev-vcs/pre-commit-5.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest