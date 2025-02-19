# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all store test typecheck"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/validate-pyproject/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	fastjsonschema<=3,>=2.16.2
	importlib-resources; extra == 'typecheck'
	mypy; extra == 'typecheck'
	packaging>=24.2; extra == 'all'
	pytest-cov; extra == 'test'
	pytest-randomly; extra == 'test'
	pytest-xdist; extra == 'test'
	pytest>=8.3.3; extra == 'test'
	repo-review; python_version >= '3.10' and extra == 'test'
	setuptools; extra == 'test'
	tomli>=1.2.1; python_version < '3.11' and extra == 'all'
	tomli>=1.2.1; python_version < '3.11' and extra == 'test'
	trove-classifiers>=2021.10.20; extra == 'all'
	validate-pyproject-schema-store; extra == 'store'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/fastjsonschema-2.16.2[${PYTHON_USEDEP}] <=dev-python/fastjsonschema-3[${PYTHON_USEDEP}]
	typecheck? ( dev-python/importlib-resources[${PYTHON_USEDEP}] )
	typecheck? ( dev-python/mypy[${PYTHON_USEDEP}] )
	all? ( >=dev-python/packaging-24.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/trove-classifiers-2021.10.20[${PYTHON_USEDEP}] )
	store? ( dev-python/validate-pyproject-schema-store[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-8.3.3[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-randomly[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/repo-review[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
