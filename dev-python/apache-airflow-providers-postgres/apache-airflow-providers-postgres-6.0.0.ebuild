# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="amazon openlineage"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apache-airflow-providers-postgres/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/apache-airflow-2.9.0[${PYTHON_USEDEP}]
	amazon? ( >=dev-python/apache-airflow-providers-amazon-2.6.0[${PYTHON_USEDEP}] )
	>=dev-python/apache-airflow-providers-common-sql-1.20.0[${PYTHON_USEDEP}]
	openlineage? ( dev-python/apache-airflow-providers-openlineage[${PYTHON_USEDEP}] )
	>=dev-python/asyncpg-0.30.0[${PYTHON_USEDEP}]
	>=dev-python/psycopg2-binary-2.9.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
