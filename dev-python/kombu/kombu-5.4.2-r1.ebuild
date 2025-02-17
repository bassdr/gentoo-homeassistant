# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/kombu/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="azureservicebus azurestoragequeues confluentkafka consul mongodb msgpack pyro qpid redis slmq sqlalchemy sqs yaml zookeeper"
IUSE="${GENERATED_IUSE} examples"

REQUIRES_DIST="
	PyYAML>=3.10; extra == 'yaml'
	amqp<6.0.0,>=5.1.1
	azure-identity>=1.12.0; extra == 'azurestoragequeues'
	azure-servicebus>=7.10.0; extra == 'azureservicebus'
	azure-storage-queue>=12.6.0; extra == 'azurestoragequeues'
	backports.zoneinfo[tzdata]>=0.2.1; python_version < '3.9'
	boto3>=1.26.143; extra == 'sqs'
	confluent-kafka>=2.2.0; extra == 'confluentkafka'
	kazoo>=2.8.0; extra == 'zookeeper'
	librabbitmq>=2.0.0; python_version < '3.11' and extra == 'librabbitmq'
	msgpack==1.1.0; extra == 'msgpack'
	pycurl>=7.43.0.5; (sys_platform != 'win32' and platform_python_implementation == 'CPython') and extra == 'sqs'
	pymongo>=4.1.1; extra == 'mongodb'
	pyro4==4.82; extra == 'pyro'
	python-consul2==0.1.5; extra == 'consul'
	qpid-python>=0.26; extra == 'qpid'
	qpid-tools>=0.26; extra == 'qpid'
	redis!=4.5.5,!=5.0.2,>=4.5.2; extra == 'redis'
	softlayer-messaging>=1.0.3; extra == 'slmq'
	sqlalchemy<2.1,>=1.4.48; extra == 'sqlalchemy'
	typing-extensions==4.12.2; python_version < '3.10'
	tzdata; python_version >= '3.9'
	urllib3>=1.26.16; extra == 'sqs'
	vine==5.1.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/amqp-5.1.1[${PYTHON_USEDEP}] <dev-python/amqp-6.0.0[${PYTHON_USEDEP}]
	azurestoragequeues? ( >=dev-python/azure-identity-1.12.0[${PYTHON_USEDEP}] )
	azureservicebus? ( >=dev-python/azure-servicebus-7.10.0[${PYTHON_USEDEP}] )
	azurestoragequeues? ( >=dev-python/azure-storage-queue-12.6.0[${PYTHON_USEDEP}] )
	sqs? ( >=dev-python/boto3-1.26.143[${PYTHON_USEDEP}] )
	confluentkafka? ( >=dev-python/confluent-kafka-2.2.0[${PYTHON_USEDEP}] )
	zookeeper? ( >=dev-python/kazoo-2.8.0[${PYTHON_USEDEP}] )
	msgpack? ( ~dev-python/msgpack-1.1.0[${PYTHON_USEDEP}] )
	sqs? ( >=dev-python/pycurl-7.43.0.5[${PYTHON_USEDEP}] )
	mongodb? ( >=dev-python/pymongo-4.1.1[${PYTHON_USEDEP}] )
	pyro? ( ~dev-python/pyro4-4.82[${PYTHON_USEDEP}] )
	consul? ( ~dev-python/python-consul2-0.1.5[${PYTHON_USEDEP}] )
	yaml? ( >=dev-python/pyyaml-3.10[${PYTHON_USEDEP}] )
	qpid? ( >=dev-python/qpid-python-0.26[${PYTHON_USEDEP}] )
	qpid? ( >=dev-python/qpid-tools-0.26[${PYTHON_USEDEP}] )
	redis? ( >=dev-python/redis-4.5.2[${PYTHON_USEDEP}] !~dev-python/redis-4.5.5[${PYTHON_USEDEP}] !~dev-python/redis-5.0.2[${PYTHON_USEDEP}] )
	slmq? ( >=dev-python/softlayer-messaging-1.0.3[${PYTHON_USEDEP}] )
	sqlalchemy? ( >=dev-python/sqlalchemy-1.4.48[${PYTHON_USEDEP}] <dev-python/sqlalchemy-2.1[${PYTHON_USEDEP}] )
	dev-python/tzdata[${PYTHON_USEDEP}]
	sqs? ( >=dev-python/urllib3-1.26.16[${PYTHON_USEDEP}] )
	~dev-python/vine-5.1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/amqp-5.1.1[${PYTHON_USEDEP}]
	<dev-python/amqp-6.0.0[${PYTHON_USEDEP}]
	dev-python/tzdata[${PYTHON_USEDEP}]
	dev-python/vine[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		app-arch/brotli[python,${PYTHON_USEDEP}]
		>=dev-python/boto3-1.22.2[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		>=dev-python/msgpack-0.3.0[${PYTHON_USEDEP}]
		dev-python/pycurl[${PYTHON_USEDEP}]
		>=dev-python/pymongo-4.1.1[${PYTHON_USEDEP}]
		dev-python/pytest-freezer[${PYTHON_USEDEP}]
		dev-python/zstandard[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-3.10[${PYTHON_USEDEP}]
		>=dev-python/redis-4.2.2[${PYTHON_USEDEP}]
		dev-python/sqlalchemy[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
distutils_enable_sphinx docs \
	dev-python/sphinx-celery

src_prepare() {
	distutils-r1_src_prepare

	# unpin deps (notably tzdata, sigh)
	> requirements/default.txt || die
}

python_test() {
	local EPYTEST_DESELECT=(
		# TODO
		t/unit/transport/test_redis.py::test_Channel::test_connparams_health_check_interval_supported
		t/unit/transport/test_redis.py::test_Channel::test_global_keyprefix_transaction
		# bad filename assumption?
		t/unit/asynchronous/aws/test_connection.py::test_AsyncHTTPSConnection::test_request_with_cert_path_https
	)
	local EPYTEST_IGNORE=(
		# obsolete Pyro4
		t/unit/transport/test_pyro.py
		# unpackaged azure
		t/unit/transport/test_azurestoragequeues.py
		# unpackage google-cloud
		t/unit/transport/test_gcpubsub.py
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}

python_install_all() {
	if use examples; then
		docompress -x "/usr/share/doc/${PF}/examples"
		docinto examples
		dodoc -r examples/.
	fi
	distutils-r1_python_install_all
}

pkg_postinst() {
	optfeature "Amazon SQS backend" "dev-python/boto3 dev-python/pycurl"
	optfeature "Etcd backend" dev-python/python-etcd
	optfeature "MongoDB backend" dev-python/pymongo
	optfeature "Redis backend" dev-python/redis
	optfeature "sqlalchemy backend" dev-python/sqlalchemy
	optfeature "yaml backend" dev-python/pyyaml
	optfeature "MessagePack (de)serializer for Python" dev-python/msgpack
	optfeature "brotli compression" "app-arch/brotli[python]"
	optfeature "zstd compression" dev-python/zstandard
}
