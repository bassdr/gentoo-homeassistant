# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="mysql postgresql"
IUSE="${GENERATED_IUSE}"

PYPI_PN="oslo.db"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/oslo.db/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/alembic-0.9.6[${PYTHON_USEDEP}]
	>=dev-python/debtcollector-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/oslo-config-5.2.0[${PYTHON_USEDEP}]
	>=dev-python/oslo-i18n-3.15.3[${PYTHON_USEDEP}]
	>=dev-python/oslo-utils-3.33.0[${PYTHON_USEDEP}]
	postgresql? ( >=dev-python/psycopg2-2.8.0[${PYTHON_USEDEP}] )
	mysql? ( >=dev-python/pymysql-0.7.6[${PYTHON_USEDEP}] )
	>=dev-python/sqlalchemy-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/stevedore-1.20.0[${PYTHON_USEDEP}]
	>=dev-python/testresources-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/testscenarios-0.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/aiosqlite-0.20.0[${PYTHON_USEDEP}]
	<dev-python/bandit-1.8.0[${PYTHON_USEDEP}]
	>=dev-python/coverage-4.0[${PYTHON_USEDEP}]
	>=dev-python/eventlet-0.18.2[${PYTHON_USEDEP}]
	>=dev-python/fixtures-3.0.0[${PYTHON_USEDEP}]
	<dev-python/hacking-6.2.0[${PYTHON_USEDEP}]
	>=dev-python/oslo-context-2.19.2[${PYTHON_USEDEP}]
	>=dev-python/oslotest-3.2.0[${PYTHON_USEDEP}]
	>=dev-python/pifpaf-0.10.0[${PYTHON_USEDEP}]
	>=dev-python/psycopg2-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/pymysql-0.7.6[${PYTHON_USEDEP}]
	>=dev-python/python-subunit-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/stestr-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/testtools-2.2.0[${PYTHON_USEDEP}]
	>=dev-vcs/pre-commit-2.6.0[${PYTHON_USEDEP}]
)"
