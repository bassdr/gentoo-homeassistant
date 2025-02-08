# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dvc-azure/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Pygments ==2.10.0 ; extra == 'tests'
	adlfs >=2023.12.0
	azure-identity >=1.4.0
	collective.checkdocs ==0.2 ; extra == 'tests'
	dvc
	dvc[testing] ; extra == 'tests'
	filelock ==3.3.2 ; extra == 'tests'
	flaky ==3.7.0 ; extra == 'tests'
	knack
	mock ==4.0.3 ; extra == 'tests'
	mypy ==0.981 ; extra == 'tests'
	pydocstyle ==6.1.1 ; extra == 'tests'
	pytest ==6.2.5 ; extra == 'tests'
	pytest-cov ==3.0.0 ; extra == 'tests'
	pytest-lazy-fixture ==0.6.3 ; extra == 'tests'
	pytest-mock ==3.6.1 ; extra == 'tests'
	pytest-servers[azure] >=0.3.0 ; extra == 'tests'
	pytest-xdist ==2.4.0 ; extra == 'tests'
	pywin32 >=225 ; (sys_platform == "win32") and extra == 'tests'
	types-requests ==2.25.11 ; extra == 'tests'
	types-tabulate ==0.8.3 ; extra == 'tests'
	types-toml ==0.10.1 ; extra == 'tests'
	wget ==3.2 ; extra == 'tests'
	wheel ==0.37.0 ; extra == 'tests'
	xmltodict ==0.12.0 ; extra == 'tests'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/adlfs-2023.12.0[${PYTHON_USEDEP}]
	>=dev-python/azure-identity-1.4.0[${PYTHON_USEDEP}]
	dev-python/dvc[${PYTHON_USEDEP}]
	dev-python/knack[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/collective-checkdocs-0.2[${PYTHON_USEDEP}]
		dev-python/dvc[testing,${PYTHON_USEDEP}]
		~dev-python/filelock-3.3.2[${PYTHON_USEDEP}]
		~dev-python/flaky-3.7.0[${PYTHON_USEDEP}]
		~dev-python/mock-4.0.3[${PYTHON_USEDEP}]
		~dev-python/mypy-0.981[${PYTHON_USEDEP}]
		~dev-python/pydocstyle-6.1.1[${PYTHON_USEDEP}]
		~dev-python/pygments-2.10.0[${PYTHON_USEDEP}]
		~dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}]
		~dev-python/pytest-lazy-fixture-0.6.3[${PYTHON_USEDEP}]
		~dev-python/pytest-mock-3.6.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-servers-0.3.0[azure,${PYTHON_USEDEP}]
		~dev-python/pytest-xdist-2.4.0[${PYTHON_USEDEP}]
		~dev-python/types-requests-2.25.11[${PYTHON_USEDEP}]
		~dev-python/types-tabulate-0.8.3[${PYTHON_USEDEP}]
		~dev-python/types-toml-0.10.1[${PYTHON_USEDEP}]
		~dev-python/wget-3.2[${PYTHON_USEDEP}]
		~dev-python/wheel-0.37.0[${PYTHON_USEDEP}]
		~dev-python/xmltodict-0.12.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
