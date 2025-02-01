# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="arrow athena aws-secrets azure azure-secrets bigquery clickhouse cloud databricks dremio excel gcp hive mssql mysql pagerduty postgresql redshift s3 snowflake spark spark-connect teradata trino vertica"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/great-expectations/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	<dev-python/altair-5.0.0[${PYTHON_USEDEP}]
	azure-secrets? ( >=dev-python/azure-identity-1.10.0[${PYTHON_USEDEP}] )
	azure? ( >=dev-python/azure-identity-1.10.0[${PYTHON_USEDEP}] )
	azure-secrets? ( >=dev-python/azure-keyvault-secrets-4.0.0[${PYTHON_USEDEP}] )
	azure? ( >=dev-python/azure-keyvault-secrets-4.0.0[${PYTHON_USEDEP}] )
	azure-secrets? ( >=dev-python/azure-storage-blob-12.5.0[${PYTHON_USEDEP}] )
	azure? ( >=dev-python/azure-storage-blob-12.5.0[${PYTHON_USEDEP}] )
	aws-secrets? ( >=dev-python/boto3-1.17.106[${PYTHON_USEDEP}] )
	s3? ( >=dev-python/boto3-1.17.106[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep '>=dev-python/clickhouse-sqlalchemy-0.2.2[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/clickhouse-sqlalchemy-0.3.0[${PYTHON_USEDEP}]' python3_13{,t})
	>=dev-python/cryptography-3.2[${PYTHON_USEDEP}]
	databricks? ( >=dev-python/databricks-sqlalchemy-1.0.0[${PYTHON_USEDEP}] )
	arrow? ( >=dev-python/feather-format-0.4.1[${PYTHON_USEDEP}] )
	bigquery? ( >=dev-python/gcsfs-0.5.1[${PYTHON_USEDEP}] )
	gcp? ( >=dev-python/gcsfs-0.5.1[${PYTHON_USEDEP}] )
	bigquery? ( >=dev-python/google-cloud-bigquery-3.3.6[${PYTHON_USEDEP}] )
	gcp? ( >=dev-python/google-cloud-bigquery-3.3.6[${PYTHON_USEDEP}] )
	bigquery? ( >=dev-python/google-cloud-bigquery-storage-2.20.0[${PYTHON_USEDEP}] )
	gcp? ( >=dev-python/google-cloud-bigquery-storage-2.20.0[${PYTHON_USEDEP}] )
	bigquery? ( >=dev-python/google-cloud-secret-manager-1.0.0[${PYTHON_USEDEP}] )
	gcp? ( >=dev-python/google-cloud-secret-manager-1.0.0[${PYTHON_USEDEP}] )
	>=dev-python/google-cloud-storage-2.10.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-storage-2.10.0[${PYTHON_USEDEP}]
	spark-connect? ( >=dev-python/googleapis-common-protos-1.56.4[${PYTHON_USEDEP}] )
	spark-connect? ( >=dev-python/grpcio-1.48.1[${PYTHON_USEDEP}] )
	spark-connect? ( >=dev-python/grpcio-status-1.48.1[${PYTHON_USEDEP}] )
	>=dev-python/jinja2-2.10[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-2.5.1[${PYTHON_USEDEP}]
	<dev-python/marshmallow-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/mistune-0.8.4[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}]' python3_13{,t})
	>=dev-python/numpy-1.22.4[${PYTHON_USEDEP}]
	excel? ( >=dev-python/openpyxl-3.0.7[${PYTHON_USEDEP}] )
	cloud? ( >=dev-python/orjson-3.9.7[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '<dev-python/pandas-2.2[${PYTHON_USEDEP}]' python3_13{,t})
	<dev-python/pandas-2.2[${PYTHON_USEDEP}]
	<dev-python/posthog-4[${PYTHON_USEDEP}]
	postgresql? ( >=dev-python/psycopg2-binary-2.7.6[${PYTHON_USEDEP}] )
	redshift? ( >=dev-python/psycopg2-binary-2.7.6[${PYTHON_USEDEP}] )
	arrow? ( dev-python/pyarrow[${PYTHON_USEDEP}] )
	athena? ( <dev-python/pyathena-3[sqlalchemy,${PYTHON_USEDEP}] )
	>=dev-python/pydantic-1.10.7[${PYTHON_USEDEP}]
	hive? ( >=dev-python/pyhive-0.6.5[${PYTHON_USEDEP}] )
	mysql? ( >=dev-python/pymysql-1.1.1[${PYTHON_USEDEP}] )
	dremio? ( >=dev-python/pyodbc-4.0.30[${PYTHON_USEDEP}] )
	mssql? ( >=dev-python/pyodbc-4.0.30[${PYTHON_USEDEP}] )
	>=dev-python/pyparsing-2.4[${PYTHON_USEDEP}]
	pagerduty? ( ~dev-python/pypd-1.1.0[${PYTHON_USEDEP}] )
	spark? ( >=dev-python/pyspark-2.3.2[${PYTHON_USEDEP}] )
	>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20[${PYTHON_USEDEP}]
	>=dev-python/ruamel-yaml-0.16[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.6.0[${PYTHON_USEDEP}]
	>dev-python/snowflake-connector-python-2.9.0[${PYTHON_USEDEP}]
	snowflake? ( !=dev-python/snowflake-sqlalchemy-1.7.0[${PYTHON_USEDEP}] )
	athena? ( >=dev-python/sqlalchemy-1.4.0[${PYTHON_USEDEP}] )
	bigquery? ( <dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}] )
	clickhouse? ( <dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}] )
	databricks? ( >=dev-python/sqlalchemy-1.4.0[${PYTHON_USEDEP}] )
	dremio? ( >=dev-python/sqlalchemy-1.4.0[${PYTHON_USEDEP}] )
	gcp? ( <dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}] )
	hive? ( >=dev-python/sqlalchemy-1.4.0[${PYTHON_USEDEP}] )
	mssql? ( >=dev-python/sqlalchemy-1.4.0[${PYTHON_USEDEP}] )
	mysql? ( >=dev-python/sqlalchemy-1.4.0[${PYTHON_USEDEP}] )
	postgresql? ( >=dev-python/sqlalchemy-1.4.0[${PYTHON_USEDEP}] )
	redshift? ( <dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}] )
	snowflake? ( >=dev-python/sqlalchemy-1.4.0[${PYTHON_USEDEP}] )
	teradata? ( <dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}] )
	trino? ( >=dev-python/sqlalchemy-1.4.0[${PYTHON_USEDEP}] )
	vertica? ( >=dev-python/sqlalchemy-1.4.0[${PYTHON_USEDEP}] )
	bigquery? ( >=dev-python/sqlalchemy-bigquery-1.3.0[${PYTHON_USEDEP}] )
	gcp? ( >=dev-python/sqlalchemy-bigquery-1.3.0[${PYTHON_USEDEP}] )
	dremio? ( ~dev-python/sqlalchemy-dremio-1.2.1[${PYTHON_USEDEP}] )
	redshift? ( >=dev-python/sqlalchemy-redshift-0.8.8[${PYTHON_USEDEP}] )
	vertica? ( >=dev-python/sqlalchemy-vertica-python-0.5.10[${PYTHON_USEDEP}] )
	teradata? ( ~dev-python/teradatasqlalchemy-17.0.0.5[${PYTHON_USEDEP}] )
	hive? ( >=dev-python/thrift-0.16.0[${PYTHON_USEDEP}] )
	hive? ( >=dev-python/thrift-sasl-0.4.3[${PYTHON_USEDEP}] )
	>=dev-python/tqdm-4.59.0[${PYTHON_USEDEP}]
	trino? ( !=dev-python/trino-0.316.0[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.1.0[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-1.2[${PYTHON_USEDEP}]
	excel? ( <dev-python/xlrd-2.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/adr-tools-python-1.0.3[${PYTHON_USEDEP}]
	>=dev-python/boto3-1.17.106[${PYTHON_USEDEP}]
	>=dev-python/coverage-7.5.1[toml,${PYTHON_USEDEP}]
	~dev-python/docstring-parser-0.16[${PYTHON_USEDEP}]
	>=dev-python/feather-format-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/flaky-3.7.0[${PYTHON_USEDEP}]
	>=dev-python/flask-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/freezegun-0.3.15[${PYTHON_USEDEP}]
	>=dev-python/invoke-2.0.0[${PYTHON_USEDEP}]
	<dev-python/moto-5.0[s3,sns,${PYTHON_USEDEP}]
	~dev-python/mypy-1.13.0[${PYTHON_USEDEP}]
	>=dev-python/pact-python-2.0.1[${PYTHON_USEDEP}]
	dev-python/pyarrow[${PYTHON_USEDEP}]
	>=dev-python/pyfakefs-4.5.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-8.2.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-benchmark-3.4.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-icdiff-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-mock-3.14.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-order-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-random-order-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-timeout-2.3.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-xdist-3.6.1[${PYTHON_USEDEP}]
	>=dev-python/requirements-parser-0.9.0[${PYTHON_USEDEP}]
	!=dev-python/responses-0.25.5[${PYTHON_USEDEP}]
	~dev-python/ruff-0.7.2[${PYTHON_USEDEP}]
	>=dev-python/setuptools-70.0.0[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/tomli-2.0.1[${PYTHON_USEDEP}]
	>=dev-vcs/pre-commit-2.21.0[${PYTHON_USEDEP}]
)"
