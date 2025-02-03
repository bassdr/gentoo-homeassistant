# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="benchmarks torch"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pylance/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/numpy-1.22[${PYTHON_USEDEP}]
	>=dev-python/pyarrow-14[${PYTHON_USEDEP}]
	benchmarks? ( dev-python/pytest-benchmark[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep '<dev-python/ray-2.38[data,${PYTHON_USEDEP}]' python3_12)
	torch? ( dev-python/torch[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	app-arch/unzip
	test? (
		dev-python/boto3[${PYTHON_USEDEP}]
		dev-python/datasets[${PYTHON_USEDEP}]
		dev-python/duckdb[${PYTHON_USEDEP}]
		dev-python/ml-dtypes[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/polars[pandas,pyarrow,${PYTHON_USEDEP}]
		dev-python/pyright[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		=dev-python/ruff-0.4.1[${PYTHON_USEDEP}]
		dev-python/tensorflow[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
