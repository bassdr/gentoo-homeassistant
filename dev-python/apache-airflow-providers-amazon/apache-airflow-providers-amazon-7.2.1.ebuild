# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="apache.hive cncf.kubernetes common.sql exasol ftp google imap mongo pandas salesforce ssh"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apache-airflow-providers-amazon/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/apache-airflow-2.3.0[${PYTHON_USEDEP}]
	apache.hive? ( dev-python/apache-airflow-providers-apache-hive[${PYTHON_USEDEP}] )
	cncf.kubernetes? ( dev-python/apache-airflow-providers-cncf-kubernetes[${PYTHON_USEDEP}] )
	>=dev-python/apache-airflow-providers-common-sql-1.3.1[${PYTHON_USEDEP}]
	common.sql? ( dev-python/apache-airflow-providers-common-sql[${PYTHON_USEDEP}] )
	exasol? ( dev-python/apache-airflow-providers-exasol[${PYTHON_USEDEP}] )
	ftp? ( dev-python/apache-airflow-providers-ftp[${PYTHON_USEDEP}] )
	google? ( dev-python/apache-airflow-providers-google[${PYTHON_USEDEP}] )
	imap? ( dev-python/apache-airflow-providers-imap[${PYTHON_USEDEP}] )
	mongo? ( dev-python/apache-airflow-providers-mongo[${PYTHON_USEDEP}] )
	salesforce? ( dev-python/apache-airflow-providers-salesforce[${PYTHON_USEDEP}] )
	ssh? ( dev-python/apache-airflow-providers-ssh[${PYTHON_USEDEP}] )
	>=dev-python/boto3-1.24.0[${PYTHON_USEDEP}]
	>=dev-python/jsonpath-ng-1.5.3[${PYTHON_USEDEP}]
	>=dev-python/mypy-boto3-appflow-1.24.0[${PYTHON_USEDEP}]
	>=dev-python/mypy-boto3-rds-1.24.0[${PYTHON_USEDEP}]
	>=dev-python/mypy-boto3-redshift-data-1.24.0[${PYTHON_USEDEP}]
	pandas? ( >=dev-python/pandas-0.17.1[${PYTHON_USEDEP}] )
	>=dev-python/redshift-connector-2.0.888[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-redshift-0.8.6[${PYTHON_USEDEP}]
	>=dev-python/watchtower-2.0.1[${PYTHON_USEDEP}] =dev-python/watchtower-2.0*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
