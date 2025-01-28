# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="aiobotocore airbyte alibaba all all-core all-dbs amazon apache-atlas apache-cassandra apache-drill apache-druid apache-flink apache-hdfs apache-hive apache-impala apache-kafka apache-kylin apache-livy apache-pig apache-pinot apache-spark apache-webhdfs apprise arangodb asana async atlas atlassian-jira aws azure cassandra celery cgroups cloudant cncf-kubernetes cohere common-io common-sql databricks datadog dbt-cloud deprecated-api devel-ci dingding discord docker druid elasticsearch exasol fab facebook ftp gcp gcp-api github github-enterprise google google-auth graphviz grpc hashicorp hdfs hive http imap influxdb jdbc jenkins kerberos kubernetes ldap leveldb microsoft-azure microsoft-mssql microsoft-psrp microsoft-winrm mongo mssql mysql neo4j odbc openai openfaas openlineage opensearch opsgenie oracle otel pagerduty pandas password pgvector pinecone pinot postgres presto pydantic qdrant rabbitmq redis s3 s3fs salesforce samba saml segment sendgrid sentry sftp singularity slack smtp snowflake spark sqlite ssh statsd tableau tabular telegram teradata trino uv vertica virtualenv weaviate webhdfs winrm yandex zendesk"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apache-airflow/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	aiobotocore? ( >=dev-python/aiobotocore-2.7.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/aiobotocore-2.7.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/aiofiles-23.2.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/aioresponses-0.7.6[${PYTHON_USEDEP}] )
	<dev-python/alembic-2.0[${PYTHON_USEDEP}]
	devel-ci? ( dev-python/amqp[${PYTHON_USEDEP}] )
	rabbitmq? ( dev-python/amqp[${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[aiobotocore,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[apache-atlas,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[apache-webhdfs,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[async,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[cgroups,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[deprecated-api,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[github-enterprise,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[google-auth,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[graphviz,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[kerberos,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[ldap,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[leveldb,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[otel,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[pandas,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[password,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[pydantic,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[rabbitmq,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[s3fs,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[saml,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[sentry,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[statsd,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[uv,${PYTHON_USEDEP}] )
	all-core? ( dev-python/apache-airflow[virtualenv,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[apache-cassandra,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[apache-drill,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[apache-druid,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[apache-hdfs,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[apache-hive,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[apache-impala,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[apache-pinot,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[arangodb,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[cloudant,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[databricks,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[exasol,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[influxdb,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[microsoft-mssql,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[mongo,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[mysql,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[neo4j,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[postgres,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[presto,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[trino,${PYTHON_USEDEP}] )
	all-dbs? ( dev-python/apache-airflow[vertica,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[aiobotocore,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[airbyte,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[alibaba,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[all-dbs,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[amazon,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[apache-atlas,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[apache-beam,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[apache-cassandra,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[apache-drill,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[apache-druid,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[apache-flink,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[apache-hdfs,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[apache-hive,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[apache-impala,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[apache-kafka,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[apache-kylin,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[apache-livy,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[apache-pig,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[apache-pinot,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[apache-spark,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[apache-webhdfs,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[apprise,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[arangodb,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[asana,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[async,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[atlassian-jira,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[celery,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[cgroups,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[cloudant,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[cncf-kubernetes,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[cohere,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[common-io,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[common-sql,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[databricks,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[datadog,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[dbt-cloud,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[deprecated-api,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[dingding,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[discord,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[docker,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[elasticsearch,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[exasol,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[fab,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[facebook,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[ftp,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[github,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[github-enterprise,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[google,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[google-auth,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[graphviz,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[grpc,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[hashicorp,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[http,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[imap,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[influxdb,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[jdbc,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[jenkins,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[kerberos,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[ldap,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[leveldb,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[microsoft-azure,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[microsoft-mssql,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[microsoft-psrp,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[microsoft-winrm,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[mongo,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[mysql,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[neo4j,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[odbc,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[openai,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[openfaas,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[openlineage,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[opensearch,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[opsgenie,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[oracle,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[otel,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[pagerduty,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[pandas,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[papermill,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[password,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[pgvector,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[pinecone,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[postgres,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[presto,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[pydantic,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[qdrant,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[rabbitmq,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[redis,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[s3fs,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[salesforce,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[samba,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[saml,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[segment,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[sendgrid,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[sentry,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[sftp,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[singularity,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[slack,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[smtp,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[snowflake,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[sqlite,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[ssh,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[statsd,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[tableau,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[tabular,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[telegram,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[teradata,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[trino,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[uv,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[vertica,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[virtualenv,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[weaviate,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[yandex,${PYTHON_USEDEP}] )
	all? ( dev-python/apache-airflow[zendesk,${PYTHON_USEDEP}] )
	atlas? ( dev-python/apache-airflow[apache-atlas,${PYTHON_USEDEP}] )
	aws? ( dev-python/apache-airflow[amazon,${PYTHON_USEDEP}] )
	azure? ( dev-python/apache-airflow[microsoft-azure,${PYTHON_USEDEP}] )
	cassandra? ( dev-python/apache-airflow[apache-cassandra,${PYTHON_USEDEP}] )
	druid? ( dev-python/apache-airflow[apache-druid,${PYTHON_USEDEP}] )
	gcp-api? ( dev-python/apache-airflow[google,${PYTHON_USEDEP}] )
	gcp? ( dev-python/apache-airflow[google,${PYTHON_USEDEP}] )
	github-enterprise? ( dev-python/apache-airflow[fab,${PYTHON_USEDEP}] )
	google-auth? ( dev-python/apache-airflow[fab,${PYTHON_USEDEP}] )
	hdfs? ( dev-python/apache-airflow[apache-hdfs,${PYTHON_USEDEP}] )
	hive? ( dev-python/apache-airflow[apache-hive,${PYTHON_USEDEP}] )
	kubernetes? ( dev-python/apache-airflow[cncf-kubernetes,${PYTHON_USEDEP}] )
	mssql? ( dev-python/apache-airflow[microsoft-mssql,${PYTHON_USEDEP}] )
	pinot? ( dev-python/apache-airflow[apache-pinot,${PYTHON_USEDEP}] )
	s3? ( dev-python/apache-airflow[amazon,${PYTHON_USEDEP}] )
	spark? ( dev-python/apache-airflow[apache-spark,${PYTHON_USEDEP}] )
	webhdfs? ( dev-python/apache-airflow[apache-webhdfs,${PYTHON_USEDEP}] )
	winrm? ( dev-python/apache-airflow[microsoft-winrm,${PYTHON_USEDEP}] )
	airbyte? ( dev-python/apache-airflow-providers-airbyte[${PYTHON_USEDEP}] )
	alibaba? ( dev-python/apache-airflow-providers-alibaba[${PYTHON_USEDEP}] )
	amazon? ( dev-python/apache-airflow-providers-amazon[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep 'dev-python/apache-airflow-providers-apache-beam[${PYTHON_USEDEP}]' python3_13{,t})
	apache-cassandra? ( dev-python/apache-airflow-providers-apache-cassandra[${PYTHON_USEDEP}] )
	apache-drill? ( dev-python/apache-airflow-providers-apache-drill[${PYTHON_USEDEP}] )
	apache-druid? ( dev-python/apache-airflow-providers-apache-druid[${PYTHON_USEDEP}] )
	apache-flink? ( dev-python/apache-airflow-providers-apache-flink[${PYTHON_USEDEP}] )
	apache-hdfs? ( dev-python/apache-airflow-providers-apache-hdfs[${PYTHON_USEDEP}] )
	apache-hive? ( dev-python/apache-airflow-providers-apache-hive[${PYTHON_USEDEP}] )
	apache-impala? ( dev-python/apache-airflow-providers-apache-impala[${PYTHON_USEDEP}] )
	apache-kafka? ( dev-python/apache-airflow-providers-apache-kafka[${PYTHON_USEDEP}] )
	apache-kylin? ( dev-python/apache-airflow-providers-apache-kylin[${PYTHON_USEDEP}] )
	apache-livy? ( dev-python/apache-airflow-providers-apache-livy[${PYTHON_USEDEP}] )
	apache-pig? ( dev-python/apache-airflow-providers-apache-pig[${PYTHON_USEDEP}] )
	apache-pinot? ( dev-python/apache-airflow-providers-apache-pinot[${PYTHON_USEDEP}] )
	apache-spark? ( dev-python/apache-airflow-providers-apache-spark[${PYTHON_USEDEP}] )
	apprise? ( dev-python/apache-airflow-providers-apprise[${PYTHON_USEDEP}] )
	arangodb? ( dev-python/apache-airflow-providers-arangodb[${PYTHON_USEDEP}] )
	asana? ( dev-python/apache-airflow-providers-asana[${PYTHON_USEDEP}] )
	atlassian-jira? ( dev-python/apache-airflow-providers-atlassian-jira[${PYTHON_USEDEP}] )
	celery? ( dev-python/apache-airflow-providers-celery[${PYTHON_USEDEP}] )
	cloudant? ( dev-python/apache-airflow-providers-cloudant[${PYTHON_USEDEP}] )
	cncf-kubernetes? ( dev-python/apache-airflow-providers-cncf-kubernetes[${PYTHON_USEDEP}] )
	cohere? ( dev-python/apache-airflow-providers-cohere[${PYTHON_USEDEP}] )
	common-io? ( dev-python/apache-airflow-providers-common-io[${PYTHON_USEDEP}] )
	dev-python/apache-airflow-providers-common-io[${PYTHON_USEDEP}]
	common-sql? ( dev-python/apache-airflow-providers-common-sql[${PYTHON_USEDEP}] )
	dev-python/apache-airflow-providers-common-sql[${PYTHON_USEDEP}]
	databricks? ( dev-python/apache-airflow-providers-databricks[${PYTHON_USEDEP}] )
	datadog? ( dev-python/apache-airflow-providers-datadog[${PYTHON_USEDEP}] )
	dbt-cloud? ( dev-python/apache-airflow-providers-dbt-cloud[${PYTHON_USEDEP}] )
	dingding? ( dev-python/apache-airflow-providers-dingding[${PYTHON_USEDEP}] )
	discord? ( dev-python/apache-airflow-providers-discord[${PYTHON_USEDEP}] )
	docker? ( dev-python/apache-airflow-providers-docker[${PYTHON_USEDEP}] )
	elasticsearch? ( dev-python/apache-airflow-providers-elasticsearch[${PYTHON_USEDEP}] )
	exasol? ( dev-python/apache-airflow-providers-exasol[${PYTHON_USEDEP}] )
	>=dev-python/apache-airflow-providers-fab-1.0.2[${PYTHON_USEDEP}]
	fab? ( dev-python/apache-airflow-providers-fab[${PYTHON_USEDEP}] )
	facebook? ( dev-python/apache-airflow-providers-facebook[${PYTHON_USEDEP}] )
	dev-python/apache-airflow-providers-ftp[${PYTHON_USEDEP}]
	ftp? ( dev-python/apache-airflow-providers-ftp[${PYTHON_USEDEP}] )
	github? ( dev-python/apache-airflow-providers-github[${PYTHON_USEDEP}] )
	google? ( dev-python/apache-airflow-providers-google[${PYTHON_USEDEP}] )
	grpc? ( dev-python/apache-airflow-providers-grpc[${PYTHON_USEDEP}] )
	hashicorp? ( dev-python/apache-airflow-providers-hashicorp[${PYTHON_USEDEP}] )
	dev-python/apache-airflow-providers-http[${PYTHON_USEDEP}]
	http? ( dev-python/apache-airflow-providers-http[${PYTHON_USEDEP}] )
	dev-python/apache-airflow-providers-imap[${PYTHON_USEDEP}]
	imap? ( dev-python/apache-airflow-providers-imap[${PYTHON_USEDEP}] )
	influxdb? ( dev-python/apache-airflow-providers-influxdb[${PYTHON_USEDEP}] )
	jdbc? ( dev-python/apache-airflow-providers-jdbc[${PYTHON_USEDEP}] )
	jenkins? ( dev-python/apache-airflow-providers-jenkins[${PYTHON_USEDEP}] )
	microsoft-azure? ( dev-python/apache-airflow-providers-microsoft-azure[${PYTHON_USEDEP}] )
	microsoft-mssql? ( dev-python/apache-airflow-providers-microsoft-mssql[${PYTHON_USEDEP}] )
	microsoft-psrp? ( dev-python/apache-airflow-providers-microsoft-psrp[${PYTHON_USEDEP}] )
	microsoft-winrm? ( dev-python/apache-airflow-providers-microsoft-winrm[${PYTHON_USEDEP}] )
	mongo? ( dev-python/apache-airflow-providers-mongo[${PYTHON_USEDEP}] )
	mysql? ( dev-python/apache-airflow-providers-mysql[${PYTHON_USEDEP}] )
	neo4j? ( dev-python/apache-airflow-providers-neo4j[${PYTHON_USEDEP}] )
	odbc? ( dev-python/apache-airflow-providers-odbc[${PYTHON_USEDEP}] )
	openai? ( dev-python/apache-airflow-providers-openai[${PYTHON_USEDEP}] )
	openfaas? ( dev-python/apache-airflow-providers-openfaas[${PYTHON_USEDEP}] )
	openlineage? ( dev-python/apache-airflow-providers-openlineage[${PYTHON_USEDEP}] )
	opensearch? ( dev-python/apache-airflow-providers-opensearch[${PYTHON_USEDEP}] )
	opsgenie? ( dev-python/apache-airflow-providers-opsgenie[${PYTHON_USEDEP}] )
	oracle? ( dev-python/apache-airflow-providers-oracle[${PYTHON_USEDEP}] )
	pagerduty? ( dev-python/apache-airflow-providers-pagerduty[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep 'dev-python/apache-airflow-providers-papermill[${PYTHON_USEDEP}]' python3_13{,t})
	pgvector? ( dev-python/apache-airflow-providers-pgvector[${PYTHON_USEDEP}] )
	pinecone? ( dev-python/apache-airflow-providers-pinecone[${PYTHON_USEDEP}] )
	postgres? ( dev-python/apache-airflow-providers-postgres[${PYTHON_USEDEP}] )
	presto? ( dev-python/apache-airflow-providers-presto[${PYTHON_USEDEP}] )
	qdrant? ( dev-python/apache-airflow-providers-qdrant[${PYTHON_USEDEP}] )
	redis? ( dev-python/apache-airflow-providers-redis[${PYTHON_USEDEP}] )
	salesforce? ( dev-python/apache-airflow-providers-salesforce[${PYTHON_USEDEP}] )
	samba? ( dev-python/apache-airflow-providers-samba[${PYTHON_USEDEP}] )
	segment? ( dev-python/apache-airflow-providers-segment[${PYTHON_USEDEP}] )
	sendgrid? ( dev-python/apache-airflow-providers-sendgrid[${PYTHON_USEDEP}] )
	sftp? ( dev-python/apache-airflow-providers-sftp[${PYTHON_USEDEP}] )
	singularity? ( dev-python/apache-airflow-providers-singularity[${PYTHON_USEDEP}] )
	slack? ( dev-python/apache-airflow-providers-slack[${PYTHON_USEDEP}] )
	dev-python/apache-airflow-providers-smtp[${PYTHON_USEDEP}]
	smtp? ( dev-python/apache-airflow-providers-smtp[${PYTHON_USEDEP}] )
	snowflake? ( dev-python/apache-airflow-providers-snowflake[${PYTHON_USEDEP}] )
	dev-python/apache-airflow-providers-sqlite[${PYTHON_USEDEP}]
	sqlite? ( dev-python/apache-airflow-providers-sqlite[${PYTHON_USEDEP}] )
	ssh? ( dev-python/apache-airflow-providers-ssh[${PYTHON_USEDEP}] )
	tableau? ( dev-python/apache-airflow-providers-tableau[${PYTHON_USEDEP}] )
	tabular? ( dev-python/apache-airflow-providers-tabular[${PYTHON_USEDEP}] )
	telegram? ( dev-python/apache-airflow-providers-telegram[${PYTHON_USEDEP}] )
	teradata? ( dev-python/apache-airflow-providers-teradata[${PYTHON_USEDEP}] )
	trino? ( dev-python/apache-airflow-providers-trino[${PYTHON_USEDEP}] )
	vertica? ( dev-python/apache-airflow-providers-vertica[${PYTHON_USEDEP}] )
	weaviate? ( dev-python/apache-airflow-providers-weaviate[${PYTHON_USEDEP}] )
	yandex? ( dev-python/apache-airflow-providers-yandex[${PYTHON_USEDEP}] )
	zendesk? ( dev-python/apache-airflow-providers-zendesk[${PYTHON_USEDEP}] )
	>=dev-python/argcomplete-1.10[${PYTHON_USEDEP}]
	dev-python/asgiref[${PYTHON_USEDEP}]
	devel-ci? ( <dev-python/astroid-3.0[${PYTHON_USEDEP}] )
	apache-atlas? ( >=dev-python/atlasclient-0.1.2[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/atlasclient-0.1.2[${PYTHON_USEDEP}] )
	>=dev-python/attrs-22.1.0[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/authlib-1.0.0[${PYTHON_USEDEP}] )
	github-enterprise? ( >=dev-python/authlib-1.0.0[${PYTHON_USEDEP}] )
	google-auth? ( >=dev-python/authlib-1.0.0[${PYTHON_USEDEP}] )
	>=dev-python/backports-zoneinfo-0.2.1[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/bcrypt-2.0.0[${PYTHON_USEDEP}] )
	password? ( >=dev-python/bcrypt-2.0.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/beautifulsoup4-4.7.1[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/black-23.12.0[${PYTHON_USEDEP}] )
	>=dev-python/blinker-1.6.2[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/blinker-1.1[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/blinker-1.7.0[${PYTHON_USEDEP}] )
	sentry? ( >=dev-python/blinker-1.1[${PYTHON_USEDEP}] )
	cgroups? ( >=dev-python/cgroupspy-0.2.2[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/cgroupspy-0.2.2[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/checksumdir-1.2.0[${PYTHON_USEDEP}] )
	devel-ci? ( !=dev-python/click-8.1.4[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/click-8.0[${PYTHON_USEDEP}] )
	<dev-python/colorlog-5.0[${PYTHON_USEDEP}]
	>=dev-python/configupdater-3.1.1[${PYTHON_USEDEP}]
	<dev-python/connexion-3.0[flask,${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/coverage-7.4.0[${PYTHON_USEDEP}] )
	>=dev-python/cron-descriptor-1.2.24[${PYTHON_USEDEP}]
	>=dev-python/croniter-2.0.2[${PYTHON_USEDEP}]
	>=dev-python/cryptography-39.0.0[${PYTHON_USEDEP}]
	>=dev-python/deprecated-1.2.13[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/diagrams-0.23.4[${PYTHON_USEDEP}] )
	>=dev-python/dill-0.2.2[${PYTHON_USEDEP}]
	devel-ci? ( <dev-python/docutils-0.17[${PYTHON_USEDEP}] )
	$(python_gen_cond_dep '>=dev-python/duckdb-0.10.0[${PYTHON_USEDEP}]' python3_13{,t})
	$(python_gen_cond_dep '>=dev-python/duckdb-0.9.0[${PYTHON_USEDEP}]' python3_12)
	devel-ci? ( >=dev-python/eralchemy2-1.3.8[${PYTHON_USEDEP}] )
	async? ( >=dev-python/eventlet-0.33.3[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/eventlet-0.33.3[${PYTHON_USEDEP}] )
	<dev-python/flask-2.3[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/flask-bcrypt-0.7.1[${PYTHON_USEDEP}] )
	password? ( >=dev-python/flask-bcrypt-0.7.1[${PYTHON_USEDEP}] )
	>=dev-python/flask-caching-1.5.0[${PYTHON_USEDEP}]
	<dev-python/flask-session-0.6[${PYTHON_USEDEP}]
	>=dev-python/flask-wtf-0.15[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2023.10.0[${PYTHON_USEDEP}]
	async? ( >=dev-python/gevent-0.13[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/gevent-0.13[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/gitpython-3.1.40[${PYTHON_USEDEP}] )
	>=dev-python/google-re2-1.0[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/graphviz-0.12[${PYTHON_USEDEP}] )
	graphviz? ( >=dev-python/graphviz-0.12[${PYTHON_USEDEP}] )
	async? ( >=dev-python/greenlet-0.4.9[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/greenlet-0.4.9[${PYTHON_USEDEP}] )
	>=dev-python/gunicorn-20.1.0[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/hatch-1.9.1[${PYTHON_USEDEP}] )
	apache-webhdfs? ( >=dev-python/hdfs-2.0.4[avro,dataframe,kerberos,${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/hdfs-2.0.4[avro,dataframe,kerberos,${PYTHON_USEDEP}] )
	dev-python/httpx[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/importlib-metadata-6.5[${PYTHON_USEDEP}]' python3_12)
	!=dev-python/importlib-resources-6.2.0[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/ipdb-0.13.13[${PYTHON_USEDEP}] )
	>=dev-python/itsdangerous-2.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.18.0[${PYTHON_USEDEP}]
	dev-python/lazy-object-proxy[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/ldap3-2.5.1[${PYTHON_USEDEP}] )
	ldap? ( >=dev-python/ldap3-2.5.1[${PYTHON_USEDEP}] )
	>=dev-python/linkify-it-py-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/lockfile-0.12.2[${PYTHON_USEDEP}]
	>=dev-python/markdown-it-py-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-oneofschema-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/mdit-py-plugins-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/methodtools-0.4.7[${PYTHON_USEDEP}]
	devel-ci? ( ~dev-python/mypy-1.9.0[${PYTHON_USEDEP}] )
	>=dev-python/opentelemetry-api-1.15.0[${PYTHON_USEDEP}]
	dev-python/opentelemetry-exporter-otlp[${PYTHON_USEDEP}]
	devel-ci? ( dev-python/opentelemetry-exporter-prometheus[${PYTHON_USEDEP}] )
	otel? ( dev-python/opentelemetry-exporter-prometheus[${PYTHON_USEDEP}] )
	>=dev-python/packaging-14.0[${PYTHON_USEDEP}]
	devel-ci? ( <dev-python/pandas-2.2[${PYTHON_USEDEP}] )
	pandas? ( <dev-python/pandas-2.2[${PYTHON_USEDEP}] )
	>=dev-python/pathspec-0.9.0[${PYTHON_USEDEP}]
	<dev-python/pendulum-4.0[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/pipdeptree-2.13.1[${PYTHON_USEDEP}] )
	>=dev-python/pluggy-1.0[${PYTHON_USEDEP}]
	devel-ci? ( dev-python/plyvel[${PYTHON_USEDEP}] )
	leveldb? ( dev-python/plyvel[${PYTHON_USEDEP}] )
	>=dev-python/psutil-4.2.0[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/pydantic-2.3.0[${PYTHON_USEDEP}] )
	pydantic? ( >=dev-python/pydantic-2.3.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/pygithub-2.1.1[${PYTHON_USEDEP}] )
	>=dev-python/pygments-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.0.0[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/pykerberos-1.1.13[${PYTHON_USEDEP}] )
	kerberos? ( >=dev-python/pykerberos-1.1.13[${PYTHON_USEDEP}] )
	devel-ci? ( <dev-python/pytest-8.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/pytest-asyncio-0.23.3[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/pytest-cov-4.1.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/pytest-custom-exit-code-0.3.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/pytest-icdiff-0.9[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/pytest-instafail-0.5.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/pytest-mock-3.12.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/pytest-rerunfailures-13.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/pytest-timeouts-1.2.1[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/pytest-xdist-3.5.0[${PYTHON_USEDEP}] )
	>=dev-python/python-daemon-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.3[${PYTHON_USEDEP}]
	devel-ci? ( dev-python/python-ldap[${PYTHON_USEDEP}] )
	ldap? ( dev-python/python-ldap[${PYTHON_USEDEP}] )
	>=dev-python/python-nvd3-0.15.0[${PYTHON_USEDEP}]
	>=dev-python/python-slugify-5.0[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/python3-saml-1.16.0[${PYTHON_USEDEP}] )
	saml? ( >=dev-python/python3-saml-1.16.0[${PYTHON_USEDEP}] )
	<dev-python/requests-3[${PYTHON_USEDEP}]
	deprecated-api? ( <dev-python/requests-3[${PYTHON_USEDEP}] )
	devel-ci? ( <dev-python/requests-3[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/requests-kerberos-0.10.0[${PYTHON_USEDEP}] )
	kerberos? ( >=dev-python/requests-kerberos-0.10.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/requests-mock-1.11.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/restructuredtext-lint-1.4.0[${PYTHON_USEDEP}] )
	>=dev-python/rfc3339-validator-0.1.4[${PYTHON_USEDEP}]
	>=dev-python/rich-12.4.4[${PYTHON_USEDEP}]
	>=dev-python/rich-argparse-1.0.0[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/rich-click-1.7.0[${PYTHON_USEDEP}] )
	devel-ci? ( ~dev-python/ruff-0.3.3[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/s3fs-2023.10.0[${PYTHON_USEDEP}] )
	s3fs? ( >=dev-python/s3fs-2023.10.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/semver-3.0.2[${PYTHON_USEDEP}] )
	devel-ci? ( !=dev-python/sentry-sdk-1.33.0[${PYTHON_USEDEP}] )
	sentry? ( !=dev-python/sentry-sdk-1.33.0[${PYTHON_USEDEP}] )
	>=dev-python/setproctitle-1.1.8[${PYTHON_USEDEP}]
	devel-ci? ( <dev-python/sphinx-6.0.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/sphinx-airflow-theme-0.0.12[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/sphinx-argparse-0.4.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/sphinx-autoapi-2.1.1[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/sphinx-copybutton-0.5.2[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/sphinx-design-0.5.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/sphinx-jinja-2.0.2[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/sphinx-rtd-theme-2.0.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/sphinxcontrib-applehelp-1.0.4[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/sphinxcontrib-devhelp-1.0.2[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/sphinxcontrib-htmlhelp-2.0.1[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/sphinxcontrib-httpdomain-1.8.1[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/sphinxcontrib-jquery-4.1[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/sphinxcontrib-jsmath-1.0.1[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/sphinxcontrib-qthelp-1.0.3[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/sphinxcontrib-redoc-1.6.0[${PYTHON_USEDEP}] )
	devel-ci? ( ~dev-python/sphinxcontrib-serializinghtml-1.1.5[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/sphinxcontrib-spelling-8.0.0[${PYTHON_USEDEP}] )
	<dev-python/sqlalchemy-2.0[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-jsonfield-1.0[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/statsd-3.3.0[${PYTHON_USEDEP}] )
	statsd? ( >=dev-python/statsd-3.3.0[${PYTHON_USEDEP}] )
	>=dev-python/tabulate-0.7.5[${PYTHON_USEDEP}]
	!=dev-python/tenacity-8.2.0[${PYTHON_USEDEP}]
	>=dev-python/termcolor-1.1.0[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/thrift-sasl-0.2.0[${PYTHON_USEDEP}] )
	kerberos? ( >=dev-python/thrift-sasl-0.2.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/time-machine-2.13.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/towncrier-23.11.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/twine-4.0.2[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-aiofiles[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-certifi[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-croniter[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-deprecated[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-docutils[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-markdown[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-paramiko[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-protobuf[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-pymysql[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-python-dateutil[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-python-slugify[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-pytz[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-pyyaml[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-redis[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-requests[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-setuptools[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-tabulate[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-termcolor[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/types-toml[${PYTHON_USEDEP}] )
	>=dev-python/unicodecsv-0.14.1[${PYTHON_USEDEP}]
	>=dev-python/universal-pathlib-0.2.2[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/uv-0.1.32[${PYTHON_USEDEP}] )
	uv? ( >=dev-python/uv-0.1.32[${PYTHON_USEDEP}] )
	devel-ci? ( dev-python/virtualenv[${PYTHON_USEDEP}] )
	virtualenv? ( dev-python/virtualenv[${PYTHON_USEDEP}] )
	<dev-python/werkzeug-3[${PYTHON_USEDEP}]
	devel-ci? ( >=dev-python/wheel-0.42.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-python/yamllint-1.33.0[${PYTHON_USEDEP}] )
	devel-ci? ( >=dev-vcs/pre-commit-3.5.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest