# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all cli"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dvc-data/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	attrs>=21.3.0
	blake3>=0.3.1; extra == "dev"
	dictdiffer>=0.8.1
	diskcache>=5.2.1
	dvc-data[all]; extra == "dev"
	dvc-data[cli]; extra == "all"
	dvc-data[tests]; extra == "dev"
	dvc-objects<6,>=4.0.1
	fsspec>=2024.2.0
	funcy>=1.14; python_version < "3.12"
	mypy==1.14.1; extra == "dev"
	orjson<4,>=3; implementation_name == "cpython"
	pygtrie>=2.3.2
	pytest-benchmark>=4; extra == "tests"
	pytest-cov>=4.1.0; extra == "tests"
	pytest-mock; extra == "tests"
	pytest-servers==0.5.9; extra == "tests"
	pytest-sugar; extra == "tests"
	pytest<9,>=7; extra == "tests"
	sqltrie<1,>=0.11.0
	tqdm<5,>=4.63.1
	typer-slim>=0.12; extra == "cli"
	types-tqdm; extra == "dev"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/attrs-21.3.0[${PYTHON_USEDEP}]
	>=dev-python/dictdiffer-0.8.1[${PYTHON_USEDEP}]
	>=dev-python/diskcache-5.2.1[${PYTHON_USEDEP}]
	all? ( dev-python/dvc-data[cli,${PYTHON_USEDEP}] )
	>=dev-python/dvc-objects-4.0.1[${PYTHON_USEDEP}] <dev-python/dvc-objects-6[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2024.2.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3[${PYTHON_USEDEP}] <dev-python/orjson-4[${PYTHON_USEDEP}]
	>=dev-python/pygtrie-2.3.2[${PYTHON_USEDEP}]
	>=dev-python/sqltrie-0.11.0[${PYTHON_USEDEP}] <dev-python/sqltrie-1[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.63.1[${PYTHON_USEDEP}] <dev-python/tqdm-5[${PYTHON_USEDEP}]
	cli? ( >=dev-python/typer-slim-0.12[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/blake3-0.3.1[${PYTHON_USEDEP}]
		dev-python/dvc-data[all,${PYTHON_USEDEP}]
		dev-python/dvc-data[tests,${PYTHON_USEDEP}]
		~dev-python/mypy-1.14.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-7[${PYTHON_USEDEP}] <dev-python/pytest-9[${PYTHON_USEDEP}]
		>=dev-python/pytest-benchmark-4[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.1.0[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		~dev-python/pytest-servers-0.5.9[${PYTHON_USEDEP}]
		dev-python/pytest-sugar[${PYTHON_USEDEP}]
		dev-python/types-tqdm[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
