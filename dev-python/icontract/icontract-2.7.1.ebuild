# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/icontract/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	astor==0.8.1; extra == 'dev'
	asttokens<3,>=2
	asyncstdlib==3.9.1; python_version >= '3.8' and extra == 'dev'
	black==23.9.1; python_version >= '3.8' and extra == 'dev'
	contextvars; python_version == '3.6'
	coverage<7,>=6.5.0; extra == 'dev'
	deal<5,>=4; python_version >= '3.8' and extra == 'dev'
	docutils<1,>=0.14; extra == 'dev'
	dpcontracts==0.6.0; extra == 'dev'
	mypy==1.5.1; python_version >= '3.8' and extra == 'dev'
	numpy<2,>=1; extra == 'dev'
	py-cpuinfo<6,>=5.0.0; extra == 'dev'
	pydocstyle<7,>=6.3.0; extra == 'dev'
	pygments<3,>=2.2.0; extra == 'dev'
	pylint==2.17.5; python_version >= '3.7' and extra == 'dev'
	tabulate<1,>=0.8.7; extra == 'dev'
	tox>=3.0.0; extra == 'dev'
	typeguard<5,>=2; extra == 'dev'
	typing-extensions
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/asttokens-2[${PYTHON_USEDEP}] <dev-python/asttokens-3[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/astor-0.8.1[${PYTHON_USEDEP}]
		>=dev-python/asyncstdlib-3.9.1[${PYTHON_USEDEP}]
		~dev-python/black-23.9.1[${PYTHON_USEDEP}]
		>=dev-python/coverage-6.5.0[${PYTHON_USEDEP}] <dev-python/coverage-7[${PYTHON_USEDEP}]
		>=dev-python/deal-4[${PYTHON_USEDEP}] <dev-python/deal-5[${PYTHON_USEDEP}]
		>=dev-python/docutils-0.14[${PYTHON_USEDEP}] <dev-python/docutils-1[${PYTHON_USEDEP}]
		~dev-python/dpcontracts-0.6.0[${PYTHON_USEDEP}]
		~dev-python/mypy-1.5.1[${PYTHON_USEDEP}]
		>=dev-python/numpy-1[${PYTHON_USEDEP}] <dev-python/numpy-2[${PYTHON_USEDEP}]
		>=dev-python/py-cpuinfo-5.0.0[${PYTHON_USEDEP}] <dev-python/py-cpuinfo-6[${PYTHON_USEDEP}]
		>=dev-python/pydocstyle-6.3.0[${PYTHON_USEDEP}] <dev-python/pydocstyle-7[${PYTHON_USEDEP}]
		>=dev-python/pygments-2.2.0[${PYTHON_USEDEP}] <dev-python/pygments-3[${PYTHON_USEDEP}]
		~dev-python/pylint-2.17.5[${PYTHON_USEDEP}]
		>=dev-python/tabulate-0.8.7[${PYTHON_USEDEP}] <dev-python/tabulate-1[${PYTHON_USEDEP}]
		>=dev-python/tox-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/typeguard-2[${PYTHON_USEDEP}] <dev-python/typeguard-5[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
