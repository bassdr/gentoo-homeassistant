# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="amazon apache-beam apache-cassandra cncf-kubernetes facebook leveldb microsoft-azure microsoft-mssql mysql openlineage oracle postgres presto salesforce sftp ssh trino"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apache-airflow-providers-google/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/apache-airflow-2.9.0[${PYTHON_USEDEP}]
	amazon? ( >=dev-python/apache-airflow-providers-amazon-2.6.0[${PYTHON_USEDEP}] )
	apache-beam? ( dev-python/apache-airflow-providers-apache-beam[${PYTHON_USEDEP}] )
	apache-cassandra? ( dev-python/apache-airflow-providers-apache-cassandra[${PYTHON_USEDEP}] )
	cncf-kubernetes? ( >=dev-python/apache-airflow-providers-cncf-kubernetes-10.1.0[${PYTHON_USEDEP}] )
	>=dev-python/apache-airflow-providers-common-compat-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/apache-airflow-providers-common-sql-1.20.0[${PYTHON_USEDEP}]
	facebook? ( >=dev-python/apache-airflow-providers-facebook-2.2.0[${PYTHON_USEDEP}] )
	microsoft-azure? ( dev-python/apache-airflow-providers-microsoft-azure[${PYTHON_USEDEP}] )
	microsoft-mssql? ( dev-python/apache-airflow-providers-microsoft-mssql[${PYTHON_USEDEP}] )
	mysql? ( dev-python/apache-airflow-providers-mysql[${PYTHON_USEDEP}] )
	openlineage? ( dev-python/apache-airflow-providers-openlineage[${PYTHON_USEDEP}] )
	oracle? ( >=dev-python/apache-airflow-providers-oracle-3.1.0[${PYTHON_USEDEP}] )
	postgres? ( dev-python/apache-airflow-providers-postgres[${PYTHON_USEDEP}] )
	presto? ( dev-python/apache-airflow-providers-presto[${PYTHON_USEDEP}] )
	salesforce? ( dev-python/apache-airflow-providers-salesforce[${PYTHON_USEDEP}] )
	sftp? ( dev-python/apache-airflow-providers-sftp[${PYTHON_USEDEP}] )
	ssh? ( dev-python/apache-airflow-providers-ssh[${PYTHON_USEDEP}] )
	trino? ( dev-python/apache-airflow-providers-trino[${PYTHON_USEDEP}] )
	apache-beam? ( dev-python/apache-beam[gcp,${PYTHON_USEDEP}] )
	>=dev-python/asgiref-3.5.2[${PYTHON_USEDEP}]
	>=dev-python/dill-0.2.3[${PYTHON_USEDEP}]
	>=dev-python/gcloud-aio-auth-5.2.0[${PYTHON_USEDEP}]
	>=dev-python/gcloud-aio-bigquery-6.1.2[${PYTHON_USEDEP}]
	>=dev-python/gcloud-aio-storage-9.0.0[${PYTHON_USEDEP}]
	>=dev-python/gcsfs-2023.10.0[${PYTHON_USEDEP}]
	>=dev-python/google-ads-25.1.0[${PYTHON_USEDEP}]
	>=dev-python/google-analytics-admin-0.9.0[${PYTHON_USEDEP}]
	!=dev-python/google-api-core-2.16.0[${PYTHON_USEDEP}]
	>=dev-python/google-api-python-client-2.0.2[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.29.0[${PYTHON_USEDEP}]
	>=dev-python/google-auth-httplib2-0.0.1[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-aiplatform-1.73.0[${PYTHON_USEDEP}]
	dev-python/google-cloud-alloydb[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-automl-2.12.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-batch-0.13.0[${PYTHON_USEDEP}]
	!=dev-python/google-cloud-bigquery-3.21*[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-bigquery-datatransfer-3.13.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-bigtable-2.17.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-build-3.22.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-compute-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-container-2.17.4[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-datacatalog-3.23.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-dataflow-client-0.8.6[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-dataform-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-dataplex-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-dataproc-5.12.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-dataproc-metastore-1.12.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-dlp-3.12.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-kms-2.15.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-language-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-logging-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-memcache-1.7.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-monitoring-2.18.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-orchestration-airflow-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-os-login-2.9.1[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-pubsub-2.19.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-redis-2.12.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-run-0.10.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-secret-manager-2.16.0[${PYTHON_USEDEP}]
	!=dev-python/google-cloud-spanner-3.49.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-speech-2.18.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-storage-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-storage-transfer-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-tasks-2.13.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-texttospeech-2.14.1[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-translate-3.16.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-videointelligence-2.11.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-vision-3.4.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-workflows-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/grpcio-gcp-0.2.2[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.25.0[${PYTHON_USEDEP}]
	>=dev-python/immutabledict-4.2.0[${PYTHON_USEDEP}]
	>=dev-python/json-merge-patch-0.2[${PYTHON_USEDEP}]
	!=dev-python/looker-sdk-24.18.0[${PYTHON_USEDEP}]
	<dev-python/pandas-2.2[${PYTHON_USEDEP}]
	>=dev-python/pandas-gbq-0.7.0[${PYTHON_USEDEP}]
	leveldb? ( >=dev-python/plyvel-1.5.1[${PYTHON_USEDEP}] )
	>=dev-python/proto-plus-1.19.6[${PYTHON_USEDEP}]
	>=dev-python/pyarrow-14.0.1[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-23.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-slugify-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-bigquery-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-spanner-1.6.2[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest