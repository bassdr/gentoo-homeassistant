# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="arangodb aws azurite chroma clickhouse cosmosdb db2 generic google influxdb k3s keycloak mailpit minio mongodb mssql mysql nats neo4j opensearch oracle qdrant rabbitmq registry scylla selenium trino weaviate"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/testcontainers/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	cosmosdb? ( dev-python/azure-cosmos[${PYTHON_USEDEP}] )
	azurite? ( <dev-python/azure-storage-blob-13.0[${PYTHON_USEDEP}] )
	registry? ( dev-python/bcrypt[${PYTHON_USEDEP}] )
	aws? ( dev-python/boto3[${PYTHON_USEDEP}] )
	scylla? ( ~dev-python/cassandra-driver-3.29.1[${PYTHON_USEDEP}] )
	chroma? ( dev-python/chromadb-client[${PYTHON_USEDEP}] )
	clickhouse? ( dev-python/clickhouse-driver[${PYTHON_USEDEP}] )
	mailpit? ( dev-python/cryptography[${PYTHON_USEDEP}] )
	dev-python/docker[${PYTHON_USEDEP}]
	google? ( >=dev-python/google-cloud-datastore-2[${PYTHON_USEDEP}] )
	google? ( >=dev-python/google-cloud-pubsub-2[${PYTHON_USEDEP}] )
	aws? ( dev-python/httpx[${PYTHON_USEDEP}] )
	db2? ( dev-python/ibm-db-sa[${PYTHON_USEDEP}] )
	influxdb? ( dev-python/influxdb[${PYTHON_USEDEP}] )
	influxdb? ( dev-python/influxdb-client[${PYTHON_USEDEP}] )
	k3s? ( dev-python/kubernetes[${PYTHON_USEDEP}] )
	minio? ( dev-python/minio[${PYTHON_USEDEP}] )
	nats? ( dev-python/nats-py[${PYTHON_USEDEP}] )
	neo4j? ( dev-python/neo4j[${PYTHON_USEDEP}] )
	opensearch? ( dev-python/opensearch-py[${PYTHON_USEDEP}] )
	oracle? ( dev-python/oracledb[${PYTHON_USEDEP}] )
	rabbitmq? ( dev-python/pika[${PYTHON_USEDEP}] )
	mongodb? ( dev-python/pymongo[${PYTHON_USEDEP}] )
	mssql? ( dev-python/pymssql[${PYTHON_USEDEP}] )
	mysql? ( dev-python/pymysql[rsa,${PYTHON_USEDEP}] )
	arangodb? ( <dev-python/python-arango-8.0[${PYTHON_USEDEP}] )
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	keycloak? ( dev-python/python-keycloak[${PYTHON_USEDEP}] )
	k3s? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
	qdrant? ( dev-python/qdrant-client[${PYTHON_USEDEP}] )
	generic? ( dev-python/redis[${PYTHON_USEDEP}] )
	selenium? ( dev-python/selenium[${PYTHON_USEDEP}] )
	db2? ( dev-python/sqlalchemy[${PYTHON_USEDEP}] )
	trino? ( dev-python/trino[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	weaviate? ( <dev-python/weaviate-client-5.0.0[${PYTHON_USEDEP}] )
	dev-python/wrapt[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
