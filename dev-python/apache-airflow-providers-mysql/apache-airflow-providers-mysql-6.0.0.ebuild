# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="amazon openlineage presto trino vertica"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apache-airflow-providers-mysql/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/aiomysql-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/apache-airflow-2.9.0[${PYTHON_USEDEP}]
	amazon? ( dev-python/apache-airflow-providers-amazon[${PYTHON_USEDEP}] )
	>=dev-python/apache-airflow-providers-common-sql-1.20.0[${PYTHON_USEDEP}]
	openlineage? ( dev-python/apache-airflow-providers-openlineage[${PYTHON_USEDEP}] )
	presto? ( dev-python/apache-airflow-providers-presto[${PYTHON_USEDEP}] )
	trino? ( dev-python/apache-airflow-providers-trino[${PYTHON_USEDEP}] )
	vertica? ( dev-python/apache-airflow-providers-vertica[${PYTHON_USEDEP}] )
	>=dev-python/mysql-connector-python-8.0.29[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
