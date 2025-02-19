# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="doc test"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/flask-restx/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Faker ==2.0.0 ; extra == 'dev'
	Faker ==2.0.0 ; extra == 'test'
	Flask !=2.0.0,>=0.8
	Sphinx ==5.3.0 ; extra == 'doc'
	alabaster ==0.7.12 ; extra == 'doc'
	aniso8601 >=0.82
	black ; extra == 'dev'
	blinker ; extra == 'dev'
	blinker ; extra == 'test'
	importlib-resources
	invoke ==2.2.0 ; extra == 'dev'
	invoke ==2.2.0 ; extra == 'test'
	jsonschema
	mock ==3.0.5 ; extra == 'dev'
	mock ==3.0.5 ; extra == 'test'
	pytest ==7.0.1 ; extra == 'dev'
	pytest ==7.0.1 ; extra == 'test'
	pytest-benchmark ==3.4.1 ; extra == 'dev'
	pytest-benchmark ==3.4.1 ; extra == 'test'
	pytest-cov ==4.0.0 ; extra == 'dev'
	pytest-cov ==4.0.0 ; extra == 'test'
	pytest-flask ==1.3.0 ; extra == 'dev'
	pytest-flask ==1.3.0 ; extra == 'test'
	pytest-mock ==3.6.1 ; extra == 'dev'
	pytest-mock ==3.6.1 ; extra == 'test'
	pytest-profiling ==1.7.0 ; extra == 'dev'
	pytest-profiling ==1.7.0 ; extra == 'test'
	pytz
	setuptools ; extra == 'dev'
	setuptools ; extra == 'test'
	sphinx-issues ==3.0.1 ; extra == 'doc'
	tox ; extra == 'dev'
	twine ==3.8.0 ; extra == 'dev'
	twine ==3.8.0 ; extra == 'test'
	tzlocal ; extra == 'dev'
	tzlocal ; extra == 'test'
	werkzeug !=2.0.0
"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( ~dev-python/alabaster-0.7.12[${PYTHON_USEDEP}] )
	>=dev-python/aniso8601-0.82[${PYTHON_USEDEP}]
	>=dev-python/flask-0.8[${PYTHON_USEDEP}] !~dev-python/flask-2.0.0[${PYTHON_USEDEP}]
	dev-python/importlib-resources[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	doc? ( ~dev-python/sphinx-5.3.0[${PYTHON_USEDEP}] )
	doc? ( ~dev-python/sphinx-issues-3.0.1[${PYTHON_USEDEP}] )
	!~dev-python/werkzeug-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/blinker[${PYTHON_USEDEP}]
		~dev-python/faker-2.0.0[${PYTHON_USEDEP}]
		~dev-python/invoke-2.2.0[${PYTHON_USEDEP}]
		~dev-python/mock-3.0.5[${PYTHON_USEDEP}]
		~dev-python/pytest-7.0.1[${PYTHON_USEDEP}]
		~dev-python/pytest-benchmark-3.4.1[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}]
		~dev-python/pytest-flask-1.3.0[${PYTHON_USEDEP}]
		~dev-python/pytest-mock-3.6.1[${PYTHON_USEDEP}]
		~dev-python/pytest-profiling-1.7.0[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
		~dev-python/twine-3.8.0[${PYTHON_USEDEP}]
		dev-python/tzlocal[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
