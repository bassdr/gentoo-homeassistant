# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="arangodb auth azureblockblob brotli cassandra consul cosmosdbsql couchbase couchdb django dynamodb elasticsearch gcs gevent memcache mongodb msgpack pymemcache pytest redis s3 slmq solar sqlalchemy sqs tblib yaml zookeeper zstd"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/celery/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Django>=2.2.28; extra == 'django'
	PyYAML>=3.10; extra == 'yaml'
	azure-storage-blob>=12.15.0; extra == 'azureblockblob'
	backports.zoneinfo>=0.2.1; python_version < '3.9'
	billiard<5.0,>=4.2.0
	boto3>=1.26.143; extra == 'dynamodb'
	boto3>=1.26.143; extra == 's3'
	boto3>=1.26.143; extra == 'sqs'
	brotli>=1.0.0; platform_python_implementation == 'CPython' and extra == 'brotli'
	brotlipy>=0.7.0; platform_python_implementation == 'PyPy' and extra == 'brotli'
	cassandra-driver<4,>=3.25.0; extra == 'cassandra'
	click-didyoumean>=0.3.0
	click-plugins>=1.1.1
	click-repl>=0.2.0
	click<9.0,>=8.1.2
	couchbase>=3.0.0; (platform_python_implementation != 'PyPy' and (platform_system != 'Windows' or python_version < '3.10')) and extra == 'couchbase'
	cryptography==42.0.5; extra == 'auth'
	elastic-transport<=8.13.0; extra == 'elasticsearch'
	elasticsearch<=8.13.0; extra == 'elasticsearch'
	ephem==4.1.5; platform_python_implementation != 'PyPy' and extra == 'solar'
	eventlet>=0.32.0; python_version < '3.10' and extra == 'eventlet'
	gevent>=1.5.0; extra == 'gevent'
	google-cloud-storage>=2.10.0; extra == 'gcs'
	importlib-metadata>=3.6; python_version < '3.8'
	kazoo>=1.3.1; extra == 'zookeeper'
	kombu<6.0,>=5.3.4
	kombu[sqs]>=5.3.4; extra == 'sqs'
	librabbitmq>=2.0.0; python_version < '3.11' and extra == 'librabbitmq'
	msgpack==1.0.8; extra == 'msgpack'
	pyArango>=2.0.2; extra == 'arangodb'
	pycouchdb==1.14.2; extra == 'couchdb'
	pycurl>=7.43.0.5; (sys_platform != 'win32' and platform_python_implementation == 'CPython') and extra == 'sqs'
	pydocumentdb==2.3.5; extra == 'cosmosdbsql'
	pylibmc==1.6.3; platform_system != 'Windows' and extra == 'memcache'
	pymongo[srv]>=4.0.2; extra == 'mongodb'
	pyro4==4.82; python_version < '3.11' and extra == 'pyro'
	pytest-celery[all]>=1.0.0; extra == 'pytest'
	python-consul2==0.1.5; extra == 'consul'
	python-dateutil>=2.8.2
	python-memcached>=1.61; extra == 'pymemcache'
	redis!=4.5.5,<6.0.0,>=4.5.2; extra == 'redis'
	softlayer-messaging>=1.0.3; extra == 'slmq'
	sqlalchemy<2.1,>=1.4.48; extra == 'sqlalchemy'
	tblib>=1.3.0; python_version < '3.8.0' and extra == 'tblib'
	tblib>=1.5.0; python_version >= '3.8.0' and extra == 'tblib'
	tzdata>=2022.7
	urllib3>=1.26.16; extra == 'sqs'
	vine<6.0,>=5.1.0
	zstandard==0.22.0; extra == 'zstd'
"
GENERATED_RDEPEND="${RDEPEND}
	brotli? ( >=app-arch/brotli-1.0.0[python,${PYTHON_USEDEP}] )
	azureblockblob? ( >=dev-python/azure-storage-blob-12.15.0[${PYTHON_USEDEP}] )
	>=dev-python/billiard-4.2.0[${PYTHON_USEDEP}] <dev-python/billiard-5.0[${PYTHON_USEDEP}]
	dynamodb? ( >=dev-python/boto3-1.26.143[${PYTHON_USEDEP}] )
	s3? ( >=dev-python/boto3-1.26.143[${PYTHON_USEDEP}] )
	sqs? ( >=dev-python/boto3-1.26.143[${PYTHON_USEDEP}] )
	cassandra? ( >=dev-python/cassandra-driver-3.25.0[${PYTHON_USEDEP}] <dev-python/cassandra-driver-4[${PYTHON_USEDEP}] )
	>=dev-python/click-8.1.2[${PYTHON_USEDEP}] <dev-python/click-9.0[${PYTHON_USEDEP}]
	>=dev-python/click-didyoumean-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/click-plugins-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/click-repl-0.2.0[${PYTHON_USEDEP}]
	couchbase? ( >=dev-python/couchbase-3.0.0[${PYTHON_USEDEP}] )
	auth? ( ~dev-python/cryptography-42.0.5[${PYTHON_USEDEP}] )
	django? ( >=dev-python/django-2.2.28[${PYTHON_USEDEP}] )
	elasticsearch? ( <=dev-python/elastic-transport-8.13.0[${PYTHON_USEDEP}] )
	elasticsearch? ( <=dev-python/elasticsearch-8.13.0[${PYTHON_USEDEP}] )
	solar? ( ~dev-python/ephem-4.1.6[${PYTHON_USEDEP}] )
	gevent? ( >=dev-python/gevent-1.5.0[${PYTHON_USEDEP}] )
	gcs? ( >=dev-python/google-cloud-storage-2.10.0[${PYTHON_USEDEP}] )
	zookeeper? ( >=dev-python/kazoo-1.3.1[${PYTHON_USEDEP}] )
	>=dev-python/kombu-5.3.4[${PYTHON_USEDEP}] <dev-python/kombu-6.0[${PYTHON_USEDEP}]
	sqs? ( >=dev-python/kombu-5.3.4[sqs,${PYTHON_USEDEP}] )
	msgpack? ( ~dev-python/msgpack-1.0.8[${PYTHON_USEDEP}] )
	arangodb? ( >=dev-python/pyarango-2.0.2[${PYTHON_USEDEP}] )
	couchdb? ( ~dev-python/pycouchdb-1.14.2[${PYTHON_USEDEP}] )
	sqs? ( >=dev-python/pycurl-7.43.0.5[${PYTHON_USEDEP}] )
	cosmosdbsql? ( ~dev-python/pydocumentdb-2.3.5[${PYTHON_USEDEP}] )
	memcache? ( ~dev-python/pylibmc-1.6.3[${PYTHON_USEDEP}] )
	mongodb? ( >=dev-python/pymongo-4.0.2[srv,${PYTHON_USEDEP}] )
	pytest? ( >=dev-python/pytest-celery-1.0.0[all,${PYTHON_USEDEP}] )
	consul? ( ~dev-python/python-consul2-0.1.5[${PYTHON_USEDEP}] )
	>=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	pymemcache? ( >=dev-python/python-memcached-1.61[${PYTHON_USEDEP}] )
	yaml? ( >=dev-python/pyyaml-3.10[${PYTHON_USEDEP}] )
	redis? ( >=dev-python/redis-4.5.2[${PYTHON_USEDEP}] <dev-python/redis-6.0.0[${PYTHON_USEDEP}] !~dev-python/redis-4.5.5[${PYTHON_USEDEP}] )
	slmq? ( >=dev-python/softlayer-messaging-1.0.3[${PYTHON_USEDEP}] )
	sqlalchemy? ( >=dev-python/sqlalchemy-1.4.48[${PYTHON_USEDEP}] <dev-python/sqlalchemy-2.1[${PYTHON_USEDEP}] )
	tblib? ( >=dev-python/tblib-1.5.0[${PYTHON_USEDEP}] )
	>=dev-python/tzdata-2022.7[${PYTHON_USEDEP}]
	sqs? ( >=dev-python/urllib3-1.26.16[${PYTHON_USEDEP}] )
	>=dev-python/vine-5.1.0[${PYTHON_USEDEP}] <dev-python/vine-6.0[${PYTHON_USEDEP}]
	zstd? ( ~dev-python/zstandard-0.22.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
