# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="pep257"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/hacking/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	coverage!=4.4,>=4.0; extra == 'test'
	ddt>=1.2.1; extra == 'test'
	eventlet!=0.18.3,!=0.20.1,>=0.18.2; extra == 'test'
	fixtures>=3.0.0; extra == 'test'
	flake8-docstrings==1.7.0; extra == 'pep257'
	flake8~=7.1.1
	python-subunit>=1.0.0; extra == 'test'
	stestr>=2.0.0; extra == 'test'
	testscenarios>=0.4; extra == 'test'
	testtools>=2.2.0; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/flake8-7.1.1[${PYTHON_USEDEP}] =dev-python/flake8-7.1*[${PYTHON_USEDEP}]
	pep257? ( ~dev-python/flake8-docstrings-1.7.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-4.0[${PYTHON_USEDEP}] !~dev-python/coverage-4.4[${PYTHON_USEDEP}]
		>=dev-python/ddt-1.2.1[${PYTHON_USEDEP}]
		>=dev-python/eventlet-0.18.2[${PYTHON_USEDEP}] !~dev-python/eventlet-0.18.3[${PYTHON_USEDEP}] !~dev-python/eventlet-0.20.1[${PYTHON_USEDEP}]
		>=dev-python/fixtures-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/python-subunit-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/stestr-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/testscenarios-0.4[${PYTHON_USEDEP}]
		>=dev-python/testtools-2.2.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
