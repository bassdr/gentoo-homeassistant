# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi toolchain-funcs

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/moto/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="all apigateway apigatewayv2 appsync awslambda batch cloudformation cognitoidp dynamodb dynamodbstreams events glue proxy quicksight resourcegroupstaggingapi s3 s3crc32c server ssm stepfunctions xray"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	Jinja2>=2.10.1
	PyYAML>=5.1; extra == 'all'
	PyYAML>=5.1; extra == 'apigateway'
	PyYAML>=5.1; extra == 'apigatewayv2'
	PyYAML>=5.1; extra == 'cloudformation'
	PyYAML>=5.1; extra == 'proxy'
	PyYAML>=5.1; extra == 'resourcegroupstaggingapi'
	PyYAML>=5.1; extra == 's3'
	PyYAML>=5.1; extra == 's3crc32c'
	PyYAML>=5.1; extra == 'server'
	PyYAML>=5.1; extra == 'ssm'
	antlr4-python3-runtime; extra == 'all'
	antlr4-python3-runtime; extra == 'proxy'
	antlr4-python3-runtime; extra == 'server'
	antlr4-python3-runtime; extra == 'stepfunctions'
	aws-xray-sdk!=0.96,>=0.93; extra == 'all'
	aws-xray-sdk!=0.96,>=0.93; extra == 'cloudformation'
	aws-xray-sdk!=0.96,>=0.93; extra == 'proxy'
	aws-xray-sdk!=0.96,>=0.93; extra == 'server'
	aws-xray-sdk!=0.96,>=0.93; extra == 'xray'
	boto3>=1.9.201
	botocore!=1.35.45,!=1.35.46,>=1.14.0
	cfn-lint>=0.40.0; extra == 'all'
	cfn-lint>=0.40.0; extra == 'cloudformation'
	cfn-lint>=0.40.0; extra == 'proxy'
	cfn-lint>=0.40.0; extra == 'resourcegroupstaggingapi'
	cfn-lint>=0.40.0; extra == 'server'
	crc32c; extra == 's3crc32c'
	cryptography>=35.0.0
	docker>=2.5.1; extra == 'proxy'
	docker>=3.0.0; extra == 'all'
	docker>=3.0.0; extra == 'awslambda'
	docker>=3.0.0; extra == 'batch'
	docker>=3.0.0; extra == 'cloudformation'
	docker>=3.0.0; extra == 'dynamodb'
	docker>=3.0.0; extra == 'dynamodbstreams'
	docker>=3.0.0; extra == 'resourcegroupstaggingapi'
	docker>=3.0.0; extra == 'server'
	flask!=2.2.0,!=2.2.1; extra == 'server'
	flask-cors; extra == 'server'
	graphql-core; extra == 'all'
	graphql-core; extra == 'appsync'
	graphql-core; extra == 'cloudformation'
	graphql-core; extra == 'proxy'
	graphql-core; extra == 'resourcegroupstaggingapi'
	graphql-core; extra == 'server'
	joserfc>=0.9.0; extra == 'all'
	joserfc>=0.9.0; extra == 'apigateway'
	joserfc>=0.9.0; extra == 'cloudformation'
	joserfc>=0.9.0; extra == 'cognitoidp'
	joserfc>=0.9.0; extra == 'proxy'
	joserfc>=0.9.0; extra == 'resourcegroupstaggingapi'
	joserfc>=0.9.0; extra == 'server'
	jsonpath-ng; extra == 'all'
	jsonpath-ng; extra == 'events'
	jsonpath-ng; extra == 'proxy'
	jsonpath-ng; extra == 'server'
	jsonpath-ng; extra == 'stepfunctions'
	jsonschema; extra == 'all'
	jsonschema; extra == 'quicksight'
	multipart; extra == 'all'
	multipart; extra == 'proxy'
	openapi-spec-validator>=0.5.0; extra == 'all'
	openapi-spec-validator>=0.5.0; extra == 'apigateway'
	openapi-spec-validator>=0.5.0; extra == 'apigatewayv2'
	openapi-spec-validator>=0.5.0; extra == 'cloudformation'
	openapi-spec-validator>=0.5.0; extra == 'proxy'
	openapi-spec-validator>=0.5.0; extra == 'resourcegroupstaggingapi'
	openapi-spec-validator>=0.5.0; extra == 'server'
	py-partiql-parser==0.6.1; extra == 'all'
	py-partiql-parser==0.6.1; extra == 'cloudformation'
	py-partiql-parser==0.6.1; extra == 'dynamodb'
	py-partiql-parser==0.6.1; extra == 'dynamodbstreams'
	py-partiql-parser==0.6.1; extra == 'proxy'
	py-partiql-parser==0.6.1; extra == 'resourcegroupstaggingapi'
	py-partiql-parser==0.6.1; extra == 's3'
	py-partiql-parser==0.6.1; extra == 's3crc32c'
	py-partiql-parser==0.6.1; extra == 'server'
	pyparsing>=3.0.7; extra == 'all'
	pyparsing>=3.0.7; extra == 'cloudformation'
	pyparsing>=3.0.7; extra == 'glue'
	pyparsing>=3.0.7; extra == 'proxy'
	pyparsing>=3.0.7; extra == 'resourcegroupstaggingapi'
	pyparsing>=3.0.7; extra == 'server'
	python-dateutil<3.0.0,>=2.1
	requests>=2.5
	responses!=0.25.5,>=0.15.0
	setuptools; extra == 'all'
	setuptools; extra == 'cloudformation'
	setuptools; extra == 'proxy'
	setuptools; extra == 'server'
	setuptools; extra == 'xray'
	werkzeug!=2.2.0,!=2.2.1,>=0.5
	xmltodict
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( dev-python/antlr4-python3-runtime[${PYTHON_USEDEP}] )
	proxy? ( dev-python/antlr4-python3-runtime[${PYTHON_USEDEP}] )
	server? ( dev-python/antlr4-python3-runtime[${PYTHON_USEDEP}] )
	stepfunctions? ( dev-python/antlr4-python3-runtime[${PYTHON_USEDEP}] )
	all? ( >=dev-python/aws-xray-sdk-0.93[${PYTHON_USEDEP}] !~dev-python/aws-xray-sdk-0.96[${PYTHON_USEDEP}] )
	cloudformation? ( >=dev-python/aws-xray-sdk-0.93[${PYTHON_USEDEP}] !~dev-python/aws-xray-sdk-0.96[${PYTHON_USEDEP}] )
	proxy? ( >=dev-python/aws-xray-sdk-0.93[${PYTHON_USEDEP}] !~dev-python/aws-xray-sdk-0.96[${PYTHON_USEDEP}] )
	server? ( >=dev-python/aws-xray-sdk-0.93[${PYTHON_USEDEP}] !~dev-python/aws-xray-sdk-0.96[${PYTHON_USEDEP}] )
	xray? ( >=dev-python/aws-xray-sdk-0.93[${PYTHON_USEDEP}] !~dev-python/aws-xray-sdk-0.96[${PYTHON_USEDEP}] )
	>=dev-python/boto3-1.9.201[${PYTHON_USEDEP}]
	>=dev-python/botocore-1.14.0[${PYTHON_USEDEP}] !~dev-python/botocore-1.35.45[${PYTHON_USEDEP}] !~dev-python/botocore-1.35.46[${PYTHON_USEDEP}]
	all? ( >=dev-python/cfn-lint-0.40.0[${PYTHON_USEDEP}] )
	cloudformation? ( >=dev-python/cfn-lint-0.40.0[${PYTHON_USEDEP}] )
	proxy? ( >=dev-python/cfn-lint-0.40.0[${PYTHON_USEDEP}] )
	resourcegroupstaggingapi? ( >=dev-python/cfn-lint-0.40.0[${PYTHON_USEDEP}] )
	server? ( >=dev-python/cfn-lint-0.40.0[${PYTHON_USEDEP}] )
	s3crc32c? ( dev-python/crc32c[${PYTHON_USEDEP}] )
	>=dev-python/cryptography-35.0.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/docker-3.0.0[${PYTHON_USEDEP}] )
	awslambda? ( >=dev-python/docker-3.0.0[${PYTHON_USEDEP}] )
	batch? ( >=dev-python/docker-3.0.0[${PYTHON_USEDEP}] )
	cloudformation? ( >=dev-python/docker-3.0.0[${PYTHON_USEDEP}] )
	dynamodb? ( >=dev-python/docker-3.0.0[${PYTHON_USEDEP}] )
	dynamodbstreams? ( >=dev-python/docker-3.0.0[${PYTHON_USEDEP}] )
	proxy? ( >=dev-python/docker-2.5.1[${PYTHON_USEDEP}] )
	resourcegroupstaggingapi? ( >=dev-python/docker-3.0.0[${PYTHON_USEDEP}] )
	server? ( >=dev-python/docker-3.0.0[${PYTHON_USEDEP}] )
	server? ( !~dev-python/flask-2.2.0[${PYTHON_USEDEP}] !~dev-python/flask-2.2.1[${PYTHON_USEDEP}] )
	server? ( dev-python/flask-cors[${PYTHON_USEDEP}] )
	all? ( dev-python/graphql-core[${PYTHON_USEDEP}] )
	appsync? ( dev-python/graphql-core[${PYTHON_USEDEP}] )
	cloudformation? ( dev-python/graphql-core[${PYTHON_USEDEP}] )
	proxy? ( dev-python/graphql-core[${PYTHON_USEDEP}] )
	resourcegroupstaggingapi? ( dev-python/graphql-core[${PYTHON_USEDEP}] )
	server? ( dev-python/graphql-core[${PYTHON_USEDEP}] )
	>=dev-python/jinja2-2.10.1[${PYTHON_USEDEP}]
	all? ( >=dev-python/joserfc-0.9.0[${PYTHON_USEDEP}] )
	apigateway? ( >=dev-python/joserfc-0.9.0[${PYTHON_USEDEP}] )
	cloudformation? ( >=dev-python/joserfc-0.9.0[${PYTHON_USEDEP}] )
	cognitoidp? ( >=dev-python/joserfc-0.9.0[${PYTHON_USEDEP}] )
	proxy? ( >=dev-python/joserfc-0.9.0[${PYTHON_USEDEP}] )
	resourcegroupstaggingapi? ( >=dev-python/joserfc-0.9.0[${PYTHON_USEDEP}] )
	server? ( >=dev-python/joserfc-0.9.0[${PYTHON_USEDEP}] )
	all? ( dev-python/jsonpath-ng[${PYTHON_USEDEP}] )
	events? ( dev-python/jsonpath-ng[${PYTHON_USEDEP}] )
	proxy? ( dev-python/jsonpath-ng[${PYTHON_USEDEP}] )
	server? ( dev-python/jsonpath-ng[${PYTHON_USEDEP}] )
	stepfunctions? ( dev-python/jsonpath-ng[${PYTHON_USEDEP}] )
	all? ( dev-python/jsonschema[${PYTHON_USEDEP}] )
	quicksight? ( dev-python/jsonschema[${PYTHON_USEDEP}] )
	all? ( dev-python/multipart[${PYTHON_USEDEP}] )
	proxy? ( dev-python/multipart[${PYTHON_USEDEP}] )
	all? ( >=dev-python/openapi-spec-validator-0.5.0[${PYTHON_USEDEP}] )
	apigateway? ( >=dev-python/openapi-spec-validator-0.5.0[${PYTHON_USEDEP}] )
	apigatewayv2? ( >=dev-python/openapi-spec-validator-0.5.0[${PYTHON_USEDEP}] )
	cloudformation? ( >=dev-python/openapi-spec-validator-0.5.0[${PYTHON_USEDEP}] )
	proxy? ( >=dev-python/openapi-spec-validator-0.5.0[${PYTHON_USEDEP}] )
	resourcegroupstaggingapi? ( >=dev-python/openapi-spec-validator-0.5.0[${PYTHON_USEDEP}] )
	server? ( >=dev-python/openapi-spec-validator-0.5.0[${PYTHON_USEDEP}] )
	all? ( ~dev-python/py-partiql-parser-0.6.1[${PYTHON_USEDEP}] )
	cloudformation? ( ~dev-python/py-partiql-parser-0.6.1[${PYTHON_USEDEP}] )
	dynamodb? ( ~dev-python/py-partiql-parser-0.6.1[${PYTHON_USEDEP}] )
	dynamodbstreams? ( ~dev-python/py-partiql-parser-0.6.1[${PYTHON_USEDEP}] )
	proxy? ( ~dev-python/py-partiql-parser-0.6.1[${PYTHON_USEDEP}] )
	resourcegroupstaggingapi? ( ~dev-python/py-partiql-parser-0.6.1[${PYTHON_USEDEP}] )
	s3? ( ~dev-python/py-partiql-parser-0.6.1[${PYTHON_USEDEP}] )
	s3crc32c? ( ~dev-python/py-partiql-parser-0.6.1[${PYTHON_USEDEP}] )
	server? ( ~dev-python/py-partiql-parser-0.6.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pyparsing-3.0.7[${PYTHON_USEDEP}] )
	cloudformation? ( >=dev-python/pyparsing-3.0.7[${PYTHON_USEDEP}] )
	glue? ( >=dev-python/pyparsing-3.0.7[${PYTHON_USEDEP}] )
	proxy? ( >=dev-python/pyparsing-3.0.7[${PYTHON_USEDEP}] )
	resourcegroupstaggingapi? ( >=dev-python/pyparsing-3.0.7[${PYTHON_USEDEP}] )
	server? ( >=dev-python/pyparsing-3.0.7[${PYTHON_USEDEP}] )
	>=dev-python/python-dateutil-2.1[${PYTHON_USEDEP}] <dev-python/python-dateutil-3.0.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/pyyaml-5.1[${PYTHON_USEDEP}] )
	apigateway? ( >=dev-python/pyyaml-5.1[${PYTHON_USEDEP}] )
	apigatewayv2? ( >=dev-python/pyyaml-5.1[${PYTHON_USEDEP}] )
	cloudformation? ( >=dev-python/pyyaml-5.1[${PYTHON_USEDEP}] )
	proxy? ( >=dev-python/pyyaml-5.1[${PYTHON_USEDEP}] )
	resourcegroupstaggingapi? ( >=dev-python/pyyaml-5.1[${PYTHON_USEDEP}] )
	s3? ( >=dev-python/pyyaml-5.1[${PYTHON_USEDEP}] )
	s3crc32c? ( >=dev-python/pyyaml-5.1[${PYTHON_USEDEP}] )
	server? ( >=dev-python/pyyaml-5.1[${PYTHON_USEDEP}] )
	ssm? ( >=dev-python/pyyaml-5.1[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.5[${PYTHON_USEDEP}]
	>=dev-python/responses-0.15.0[${PYTHON_USEDEP}] !~dev-python/responses-0.25.5[${PYTHON_USEDEP}]
	all? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	cloudformation? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	proxy? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	server? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	xray? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	>=dev-python/werkzeug-0.5[${PYTHON_USEDEP}] !~dev-python/werkzeug-2.2.0[${PYTHON_USEDEP}] !~dev-python/werkzeug-2.2.1[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aws-xray-sdk-0.93[${PYTHON_USEDEP}]
	dev-python/boto3[${PYTHON_USEDEP}]
	>=dev-python/botocore-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/cfn-lint-0.40.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-35.0.0[${PYTHON_USEDEP}]
	dev-python/cookies[${PYTHON_USEDEP}]
	>=dev-python/docker-3.0.0[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/flask-cors[${PYTHON_USEDEP}]
	>=dev-python/idna-2.5[${PYTHON_USEDEP}]
	>=dev-python/jinja2-2.10.1[${PYTHON_USEDEP}]
	dev-python/jsonpath-ng[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/more-itertools[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-3.0.7[${PYTHON_USEDEP}]
	>=dev-python/openapi-spec-validator-0.5.0[${PYTHON_USEDEP}]
	dev-python/pyaml[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.1[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/python-jose[${PYTHON_USEDEP}]
	>=dev-python/responses-0.15.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.5[${PYTHON_USEDEP}]
	dev-python/sshpubkeys[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
	dev-python/zipp[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/antlr4-python3-runtime[${PYTHON_USEDEP}]
		dev-python/freezegun[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
	)
"

: "${EPYTEST_TIMEOUT:=180}"
EPYTEST_XDIST=1
distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# Needs network (or docker?) but not marked as such, bug #807031
		# TODO: report upstream
		tests/test_core/test_request_passthrough.py
		tests/test_core/test_responses_module.py::TestResponsesMockWithPassThru::test_aws_and_http_requests
		tests/test_core/test_responses_module.py::TestResponsesMockWithPassThru::test_http_requests
		# broken code? (local variable used referenced before definition)
		tests/test_appsync/test_appsync_schema.py
		# require py_partiql_parser
		tests/test_s3/test_s3_select.py
		tests/test_dynamodb/test_dynamodb_statements.py
		# require joserfc
		tests/test_apigateway/test_apigateway.py::test_update_authorizer_configuration
		tests/test_apigateway/test_apigateway.py::test_create_authorizer
		tests/test_apigateway/test_apigateway.py::test_delete_authorizer
		tests/test_cognitoidp/test_cognitoidp_exceptions.py::TestCognitoUserDeleter::test_authenticate_with_signed_out_user
		tests/test_cognitoidp/test_cognitoidp_exceptions.py::TestCognitoUserPoolDuplidateEmails::test_use_existing_email__when_email_is_
		tests/test_cognitoidp/test_cognitoidp_exceptions.py::TestCognitoUserPoolDuplidateEmails::test_use_existing_email__when_username_
		tests/test_cognitoidp/test_cognitoidp_replay.py::TestCreateUserPoolWithPredeterminedID::test_different_seed
		tests/test_cognitoidp/test_cognitoidp_replay.py::TestCreateUserPoolWithPredeterminedID::test_same_seed
		tests/test_cognitoidp/test_server.py::test_sign_up_user_without_authentication
		tests/test_cognitoidp/test_server.py::test_admin_create_user_without_authentication
		tests/test_cognitoidp/test_server.py::test_associate_software_token
		# TODO
		tests/test_dynamodb/test_dynamodb_import_table.py
		tests/test_firehose/test_firehose_put.py::test_put_record_http_destination
		tests/test_firehose/test_firehose_put.py::test_put_record_batch_http_destination
		tests/test_stepfunctions/parser/test_stepfunctions_dynamodb_integration.py::test_zero_retry
		# random crashes
		tests/test_stepfunctions/parser/test_stepfunctions_sns_integration.py
		tests/test_stepfunctions/parser/test_stepfunctions_sqs_integration.py
		tests/test_stepfunctions/test_stepfunctions.py
	)
	local EPYTEST_IGNORE=(
		# require joserfc
		tests/test_cognitoidp/test_cognitoidp.py
	)

	case ${EPYTHON} in
		python3.13)
			EPYTEST_DESELECT+=(
				# suddenly started crashing, *shrug*
				tests/test_xray/test_xray_client.py::test_xray_context_patched
				tests/test_xray/test_xray_client.py::test_xray_dynamo_request_id
				tests/test_xray/test_xray_client.py::test_xray_dynamo_request_id_with_context_mgr
				tests/test_xray/test_xray_client.py::test_xray_udp_emitter_patched
			)
			;;
	esac

	if ! tc-has-64bit-time_t; then
		einfo "time_t is smaller than 64 bits, will skip broken tests"
		EPYTEST_DESELECT+=(
			tests/test_acm/test_acm.py::test_request_certificate_with_optional_arguments
			tests/test_s3/test_multiple_accounts_server.py::TestAccountIdResolution::test_with_custom_request_header
			tests/test_s3/test_server.py::test_s3_server_post_cors_multiple_origins
		)
		EPYTEST_IGNORE+=(
			tests/test_route53domains/test_route53domains_domain.py
		)
	fi

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x TZ=UTC

	rm -rf moto || die
	epytest -m 'not network and not requires_docker' \
		-p rerunfailures --reruns=5
}
