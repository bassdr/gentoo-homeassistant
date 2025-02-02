# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="arrow babel color encrypted intervals password pendulum phone test-all timezone url"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
PYPI_PN="SQLAlchemy-Utils"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sqlalchemy_utils/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	arrow? ( >=dev-python/arrow-0.3.4[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/arrow-0.3.4[${PYTHON_USEDEP}] )
	babel? ( >=dev-python/babel-1.3[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/babel-1.3[${PYTHON_USEDEP}] )
	dev-python/backports-zoneinfo[${PYTHON_USEDEP}]
	color? ( >=dev-python/colour-0.0.4[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/colour-0.0.4[${PYTHON_USEDEP}] )
	encrypted? ( >=dev-python/cryptography-0.6[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/cryptography-0.6[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/docutils-0.10[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/flake8-2.4.0[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/flexmock-0.9.7[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/furl-0.4.1[${PYTHON_USEDEP}] )
	url? ( >=dev-python/furl-0.4.1[${PYTHON_USEDEP}] )
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	intervals? ( >=dev-python/intervals-0.7.1[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/intervals-0.7.1[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/isort-4.2.2[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/jinja2-2.3[${PYTHON_USEDEP}] )
	password? ( <dev-python/passlib-2.0[${PYTHON_USEDEP}] )
	test-all? ( <dev-python/passlib-2.0[${PYTHON_USEDEP}] )
	pendulum? ( >=dev-python/pendulum-2.0.5[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/pendulum-2.0.5[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/pg8000-1.12.4[${PYTHON_USEDEP}] )
	phone? ( >=dev-python/phonenumbers-5.9.2[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/phonenumbers-5.9.2[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/psycopg-3.1.8[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/psycopg2-2.5.1[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/psycopg2cffi-2.8.1[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/pygments-1.2[${PYTHON_USEDEP}] )
	test-all? ( dev-python/pymysql[${PYTHON_USEDEP}] )
	test-all? ( dev-python/pyodbc[${PYTHON_USEDEP}] )
	test-all? ( ~dev-python/pytest-7.4.4[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/python-dateutil-2.6[${PYTHON_USEDEP}] )
	test-all? ( dev-python/python-dateutil[${PYTHON_USEDEP}] )
	timezone? ( dev-python/python-dateutil[${PYTHON_USEDEP}] )
	test-all? ( >=dev-python/pytz-2014.2[${PYTHON_USEDEP}] )
	>=dev-python/sqlalchemy-1.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/docutils-0.10[${PYTHON_USEDEP}]
	>=dev-python/flake8-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/flexmock-0.9.7[${PYTHON_USEDEP}]
	>=dev-python/isort-4.2.2[${PYTHON_USEDEP}]
	>=dev-python/jinja2-2.3[${PYTHON_USEDEP}]
	>=dev-python/pg8000-1.12.4[${PYTHON_USEDEP}]
	>=dev-python/psycopg-3.1.8[${PYTHON_USEDEP}]
	>=dev-python/psycopg2-2.5.1[${PYTHON_USEDEP}]
	>=dev-python/psycopg2cffi-2.8.1[${PYTHON_USEDEP}]
	>=dev-python/pygments-1.2[${PYTHON_USEDEP}]
	dev-python/pymysql[${PYTHON_USEDEP}]
	dev-python/pyodbc[${PYTHON_USEDEP}]
	~dev-python/pytest-7.4.4[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.6[${PYTHON_USEDEP}]
	>=dev-python/pytz-2014.2[${PYTHON_USEDEP}]
)"
