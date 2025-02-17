# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="amazon microsoft-mssql mysql presto samba vertica"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apache-airflow-providers-apache-hive/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	apache-airflow-providers-amazon; extra == 'amazon'
	apache-airflow-providers-common-sql>=1.20.0
	apache-airflow-providers-microsoft-mssql; extra == 'microsoft-mssql'
	apache-airflow-providers-mysql; extra == 'mysql'
	apache-airflow-providers-presto; extra == 'presto'
	apache-airflow-providers-samba; extra == 'samba'
	apache-airflow-providers-vertica; extra == 'vertica'
	apache-airflow>=2.9.0
	hmsclient>=0.1.0
	jmespath>=0.7.0
	pandas<2.2,>=1.5.3; python_version < '3.9'
	pandas<2.2,>=2.1.2; python_version >= '3.9'
	pyhive[hive-pure-sasl]>=0.7.0
	thrift>=0.11.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/apache-airflow-2.9.0[${PYTHON_USEDEP}]
	amazon? ( dev-python/apache-airflow-providers-amazon[${PYTHON_USEDEP}] )
	>=dev-python/apache-airflow-providers-common-sql-1.20.0[${PYTHON_USEDEP}]
	microsoft-mssql? ( dev-python/apache-airflow-providers-microsoft-mssql[${PYTHON_USEDEP}] )
	mysql? ( dev-python/apache-airflow-providers-mysql[${PYTHON_USEDEP}] )
	presto? ( dev-python/apache-airflow-providers-presto[${PYTHON_USEDEP}] )
	samba? ( dev-python/apache-airflow-providers-samba[${PYTHON_USEDEP}] )
	vertica? ( dev-python/apache-airflow-providers-vertica[${PYTHON_USEDEP}] )
	>=dev-python/hmsclient-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/jmespath-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.1.2[${PYTHON_USEDEP}] <dev-python/pandas-2.2[${PYTHON_USEDEP}]
	>=dev-python/pyhive-0.7.0[hive-pure-sasl,${PYTHON_USEDEP}]
	>=dev-python/thrift-0.11.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
