# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/graphene/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	coveralls<5,>=3.3; extra == 'dev'
	coveralls<5,>=3.3; extra == 'test'
	graphql-core<3.3,>=3.1
	graphql-relay<3.3,>=3.1
	mypy<2,>=1.10; extra == 'dev'
	pytest-asyncio<2,>=0.16; extra == 'dev'
	pytest-asyncio<2,>=0.16; extra == 'test'
	pytest-benchmark<5,>=4; extra == 'dev'
	pytest-benchmark<5,>=4; extra == 'test'
	pytest-cov<6,>=5; extra == 'dev'
	pytest-cov<6,>=5; extra == 'test'
	pytest-mock<4,>=3; extra == 'dev'
	pytest-mock<4,>=3; extra == 'test'
	pytest<9,>=8; extra == 'dev'
	pytest<9,>=8; extra == 'test'
	python-dateutil<3,>=2.7.0
	ruff==0.5.0; extra == 'dev'
	types-python-dateutil<3,>=2.8.1; extra == 'dev'
	typing-extensions<5,>=4.7.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/graphql-core-3.1[${PYTHON_USEDEP}] <dev-python/graphql-core-3.3[${PYTHON_USEDEP}]
	>=dev-python/graphql-relay-3.1[${PYTHON_USEDEP}] <dev-python/graphql-relay-3.3[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.7.0[${PYTHON_USEDEP}] <dev-python/python-dateutil-3[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.7.1[${PYTHON_USEDEP}] <dev-python/typing-extensions-5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coveralls-3.3[${PYTHON_USEDEP}] <dev-python/coveralls-5[${PYTHON_USEDEP}]
		>=dev-python/mypy-1.10[${PYTHON_USEDEP}] <dev-python/mypy-2[${PYTHON_USEDEP}]
		>=dev-python/pytest-8[${PYTHON_USEDEP}] <dev-python/pytest-9[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.16[${PYTHON_USEDEP}] <dev-python/pytest-asyncio-2[${PYTHON_USEDEP}]
		>=dev-python/pytest-benchmark-4[${PYTHON_USEDEP}] <dev-python/pytest-benchmark-5[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-5[${PYTHON_USEDEP}] <dev-python/pytest-cov-6[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3[${PYTHON_USEDEP}] <dev-python/pytest-mock-4[${PYTHON_USEDEP}]
		~dev-python/ruff-0.5.0[${PYTHON_USEDEP}]
		>=dev-python/types-python-dateutil-2.8.1[${PYTHON_USEDEP}] <dev-python/types-python-dateutil-3[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
