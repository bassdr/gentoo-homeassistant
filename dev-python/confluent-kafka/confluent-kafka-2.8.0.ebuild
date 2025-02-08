# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all avro docs examples json protobuf rules schemaregistry soaktest"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/confluent-kafka/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	attrs; extra == "all"
	attrs; extra == "avro"
	attrs; extra == "dev"
	attrs; extra == "docs"
	attrs; extra == "examples"
	attrs; extra == "json"
	attrs; extra == "protobuf"
	attrs; extra == "rules"
	attrs; extra == "schemaregistry"
	attrs; extra == "tests"
	avro<2,>=1.11.1; extra == "all"
	avro<2,>=1.11.1; extra == "avro"
	avro<2,>=1.11.1; extra == "dev"
	avro<2,>=1.11.1; extra == "docs"
	avro<2,>=1.11.1; extra == "examples"
	avro<2,>=1.11.1; extra == "tests"
	azure-identity; extra == "all"
	azure-identity; extra == "dev"
	azure-identity; extra == "docs"
	azure-identity; extra == "examples"
	azure-identity; extra == "rules"
	azure-identity; extra == "tests"
	azure-keyvault-keys; extra == "all"
	azure-keyvault-keys; extra == "dev"
	azure-keyvault-keys; extra == "docs"
	azure-keyvault-keys; extra == "examples"
	azure-keyvault-keys; extra == "rules"
	azure-keyvault-keys; extra == "tests"
	boto3; extra == "all"
	boto3; extra == "dev"
	boto3; extra == "docs"
	boto3; extra == "examples"
	boto3; extra == "rules"
	boto3; extra == "tests"
	cachetools; extra == "all"
	cachetools; extra == "avro"
	cachetools; extra == "dev"
	cachetools; extra == "docs"
	cachetools; extra == "examples"
	cachetools; extra == "json"
	cachetools; extra == "protobuf"
	cachetools; extra == "rules"
	cachetools; extra == "schemaregistry"
	cachetools; extra == "tests"
	cel-python>=0.1.5; extra == "all"
	cel-python>=0.1.5; extra == "dev"
	cel-python>=0.1.5; extra == "docs"
	cel-python>=0.1.5; extra == "examples"
	cel-python>=0.1.5; extra == "rules"
	cel-python>=0.1.5; extra == "tests"
	confluent-kafka; extra == "all"
	confluent-kafka; extra == "dev"
	confluent-kafka; extra == "examples"
	fastapi; extra == "all"
	fastapi; extra == "dev"
	fastapi; extra == "examples"
	fastavro<1.8.0; python_version == "3.7" and extra == "all"
	fastavro<1.8.0; python_version == "3.7" and extra == "avro"
	fastavro<1.8.0; python_version == "3.7" and extra == "dev"
	fastavro<1.8.0; python_version == "3.7" and extra == "docs"
	fastavro<1.8.0; python_version == "3.7" and extra == "examples"
	fastavro<1.8.0; python_version == "3.7" and extra == "tests"
	fastavro<2; python_version > "3.7" and extra == "all"
	fastavro<2; python_version > "3.7" and extra == "avro"
	fastavro<2; python_version > "3.7" and extra == "dev"
	fastavro<2; python_version > "3.7" and extra == "docs"
	fastavro<2; python_version > "3.7" and extra == "examples"
	fastavro<2; python_version > "3.7" and extra == "tests"
	flake8; extra == "all"
	flake8; extra == "dev"
	flake8; extra == "tests"
	google-api-core; extra == "all"
	google-api-core; extra == "dev"
	google-api-core; extra == "docs"
	google-api-core; extra == "examples"
	google-api-core; extra == "rules"
	google-api-core; extra == "tests"
	google-auth; extra == "all"
	google-auth; extra == "dev"
	google-auth; extra == "docs"
	google-auth; extra == "examples"
	google-auth; extra == "rules"
	google-auth; extra == "tests"
	google-cloud-kms; extra == "all"
	google-cloud-kms; extra == "dev"
	google-cloud-kms; extra == "docs"
	google-cloud-kms; extra == "examples"
	google-cloud-kms; extra == "rules"
	google-cloud-kms; extra == "tests"
	googleapis-common-protos; extra == "all"
	googleapis-common-protos; extra == "dev"
	googleapis-common-protos; extra == "docs"
	googleapis-common-protos; extra == "examples"
	googleapis-common-protos; extra == "protobuf"
	googleapis-common-protos; extra == "tests"
	hkdf==0.0.3; extra == "all"
	hkdf==0.0.3; extra == "dev"
	hkdf==0.0.3; extra == "docs"
	hkdf==0.0.3; extra == "examples"
	hkdf==0.0.3; extra == "rules"
	hkdf==0.0.3; extra == "tests"
	httpx; extra == "all"
	httpx; extra == "avro"
	httpx; extra == "dev"
	httpx; extra == "docs"
	httpx; extra == "examples"
	httpx; extra == "json"
	httpx; extra == "protobuf"
	httpx; extra == "rules"
	httpx; extra == "schemaregistry"
	httpx; extra == "tests"
	hvac; extra == "all"
	hvac; extra == "dev"
	hvac; extra == "docs"
	hvac; extra == "examples"
	hvac; extra == "rules"
	hvac; extra == "tests"
	jsonata-python; extra == "all"
	jsonata-python; extra == "dev"
	jsonata-python; extra == "docs"
	jsonata-python; extra == "examples"
	jsonata-python; extra == "rules"
	jsonata-python; extra == "tests"
	jsonschema; extra == "all"
	jsonschema; extra == "dev"
	jsonschema; extra == "docs"
	jsonschema; extra == "examples"
	jsonschema; extra == "json"
	jsonschema; extra == "tests"
	opentelemetry-distro; extra == "all"
	opentelemetry-distro; extra == "soaktest"
	opentelemetry-exporter-otlp; extra == "all"
	opentelemetry-exporter-otlp; extra == "soaktest"
	protobuf; extra == "all"
	protobuf; extra == "dev"
	protobuf; extra == "docs"
	protobuf; extra == "examples"
	protobuf; extra == "protobuf"
	protobuf; extra == "tests"
	psutil; extra == "all"
	psutil; extra == "soaktest"
	pydantic; extra == "all"
	pydantic; extra == "dev"
	pydantic; extra == "examples"
	pyrsistent; extra == "all"
	pyrsistent; extra == "dev"
	pyrsistent; extra == "docs"
	pyrsistent; extra == "examples"
	pyrsistent; extra == "json"
	pyrsistent; extra == "tests"
	pytest-timeout; extra == "all"
	pytest-timeout; extra == "dev"
	pytest-timeout; extra == "tests"
	pytest; extra == "all"
	pytest; extra == "dev"
	pytest; extra == "tests"
	pytest_cov; extra == "all"
	pytest_cov; extra == "dev"
	pytest_cov; extra == "tests"
	pyyaml>=6.0.0; extra == "all"
	pyyaml>=6.0.0; extra == "dev"
	pyyaml>=6.0.0; extra == "docs"
	pyyaml>=6.0.0; extra == "examples"
	pyyaml>=6.0.0; extra == "rules"
	pyyaml>=6.0.0; extra == "tests"
	requests-mock; extra == "all"
	requests-mock; extra == "dev"
	requests-mock; extra == "tests"
	requests; extra == "all"
	requests; extra == "avro"
	requests; extra == "dev"
	requests; extra == "docs"
	requests; extra == "examples"
	requests; extra == "tests"
	respx; extra == "all"
	respx; extra == "dev"
	respx; extra == "tests"
	six; extra == "all"
	six; extra == "dev"
	six; extra == "examples"
	sphinx-rtd-theme; extra == "all"
	sphinx-rtd-theme; extra == "dev"
	sphinx-rtd-theme; extra == "docs"
	sphinx; extra == "all"
	sphinx; extra == "dev"
	sphinx; extra == "docs"
	tink; extra == "all"
	tink; extra == "dev"
	tink; extra == "docs"
	tink; extra == "examples"
	tink; extra == "rules"
	tink; extra == "tests"
	urllib3<2.0.0; python_version <= "3.7" and extra == "all"
	urllib3<2.0.0; python_version <= "3.7" and extra == "dev"
	urllib3<2.0.0; python_version <= "3.7" and extra == "tests"
	urllib3<3,>=2.0.0; python_version > "3.7" and extra == "all"
	urllib3<3,>=2.0.0; python_version > "3.7" and extra == "dev"
	urllib3<3,>=2.0.0; python_version > "3.7" and extra == "tests"
	uvicorn; extra == "all"
	uvicorn; extra == "dev"
	uvicorn; extra == "examples"
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( dev-python/attrs[${PYTHON_USEDEP}] )
	avro? ( dev-python/attrs[${PYTHON_USEDEP}] )
	docs? ( dev-python/attrs[${PYTHON_USEDEP}] )
	examples? ( dev-python/attrs[${PYTHON_USEDEP}] )
	json? ( dev-python/attrs[${PYTHON_USEDEP}] )
	protobuf? ( dev-python/attrs[${PYTHON_USEDEP}] )
	rules? ( dev-python/attrs[${PYTHON_USEDEP}] )
	schemaregistry? ( dev-python/attrs[${PYTHON_USEDEP}] )
	all? ( >=dev-python/avro-1.11.1[${PYTHON_USEDEP}] <dev-python/avro-2[${PYTHON_USEDEP}] )
	avro? ( >=dev-python/avro-1.11.1[${PYTHON_USEDEP}] <dev-python/avro-2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/avro-1.11.1[${PYTHON_USEDEP}] <dev-python/avro-2[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/avro-1.11.1[${PYTHON_USEDEP}] <dev-python/avro-2[${PYTHON_USEDEP}] )
	all? ( dev-python/azure-identity[${PYTHON_USEDEP}] )
	docs? ( dev-python/azure-identity[${PYTHON_USEDEP}] )
	examples? ( dev-python/azure-identity[${PYTHON_USEDEP}] )
	rules? ( dev-python/azure-identity[${PYTHON_USEDEP}] )
	all? ( dev-python/azure-keyvault-keys[${PYTHON_USEDEP}] )
	docs? ( dev-python/azure-keyvault-keys[${PYTHON_USEDEP}] )
	examples? ( dev-python/azure-keyvault-keys[${PYTHON_USEDEP}] )
	rules? ( dev-python/azure-keyvault-keys[${PYTHON_USEDEP}] )
	all? ( dev-python/boto3[${PYTHON_USEDEP}] )
	docs? ( dev-python/boto3[${PYTHON_USEDEP}] )
	examples? ( dev-python/boto3[${PYTHON_USEDEP}] )
	rules? ( dev-python/boto3[${PYTHON_USEDEP}] )
	all? ( dev-python/cachetools[${PYTHON_USEDEP}] )
	avro? ( dev-python/cachetools[${PYTHON_USEDEP}] )
	docs? ( dev-python/cachetools[${PYTHON_USEDEP}] )
	examples? ( dev-python/cachetools[${PYTHON_USEDEP}] )
	json? ( dev-python/cachetools[${PYTHON_USEDEP}] )
	protobuf? ( dev-python/cachetools[${PYTHON_USEDEP}] )
	rules? ( dev-python/cachetools[${PYTHON_USEDEP}] )
	schemaregistry? ( dev-python/cachetools[${PYTHON_USEDEP}] )
	all? ( >=dev-python/cel-python-0.1.5[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/cel-python-0.1.5[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/cel-python-0.1.5[${PYTHON_USEDEP}] )
	rules? ( >=dev-python/cel-python-0.1.5[${PYTHON_USEDEP}] )
	all? ( dev-python/confluent-kafka[${PYTHON_USEDEP}] )
	examples? ( dev-python/confluent-kafka[${PYTHON_USEDEP}] )
	all? ( dev-python/fastapi[${PYTHON_USEDEP}] )
	examples? ( dev-python/fastapi[${PYTHON_USEDEP}] )
	all? ( <dev-python/fastavro-2[${PYTHON_USEDEP}] )
	avro? ( <dev-python/fastavro-2[${PYTHON_USEDEP}] )
	docs? ( <dev-python/fastavro-2[${PYTHON_USEDEP}] )
	examples? ( <dev-python/fastavro-2[${PYTHON_USEDEP}] )
	all? ( dev-python/flake8[${PYTHON_USEDEP}] )
	all? ( dev-python/google-api-core[${PYTHON_USEDEP}] )
	docs? ( dev-python/google-api-core[${PYTHON_USEDEP}] )
	examples? ( dev-python/google-api-core[${PYTHON_USEDEP}] )
	rules? ( dev-python/google-api-core[${PYTHON_USEDEP}] )
	all? ( dev-python/google-auth[${PYTHON_USEDEP}] )
	docs? ( dev-python/google-auth[${PYTHON_USEDEP}] )
	examples? ( dev-python/google-auth[${PYTHON_USEDEP}] )
	rules? ( dev-python/google-auth[${PYTHON_USEDEP}] )
	all? ( dev-python/google-cloud-kms[${PYTHON_USEDEP}] )
	docs? ( dev-python/google-cloud-kms[${PYTHON_USEDEP}] )
	examples? ( dev-python/google-cloud-kms[${PYTHON_USEDEP}] )
	rules? ( dev-python/google-cloud-kms[${PYTHON_USEDEP}] )
	all? ( dev-python/googleapis-common-protos[${PYTHON_USEDEP}] )
	docs? ( dev-python/googleapis-common-protos[${PYTHON_USEDEP}] )
	examples? ( dev-python/googleapis-common-protos[${PYTHON_USEDEP}] )
	protobuf? ( dev-python/googleapis-common-protos[${PYTHON_USEDEP}] )
	all? ( ~dev-python/hkdf-0.0.3[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/hkdf-0.0.3[${PYTHON_USEDEP}] )
	examples? ( ~dev-python/hkdf-0.0.3[${PYTHON_USEDEP}] )
	rules? ( ~dev-python/hkdf-0.0.3[${PYTHON_USEDEP}] )
	all? ( dev-python/httpx[${PYTHON_USEDEP}] )
	avro? ( dev-python/httpx[${PYTHON_USEDEP}] )
	docs? ( dev-python/httpx[${PYTHON_USEDEP}] )
	examples? ( dev-python/httpx[${PYTHON_USEDEP}] )
	json? ( dev-python/httpx[${PYTHON_USEDEP}] )
	protobuf? ( dev-python/httpx[${PYTHON_USEDEP}] )
	rules? ( dev-python/httpx[${PYTHON_USEDEP}] )
	schemaregistry? ( dev-python/httpx[${PYTHON_USEDEP}] )
	all? ( dev-python/hvac[${PYTHON_USEDEP}] )
	docs? ( dev-python/hvac[${PYTHON_USEDEP}] )
	examples? ( dev-python/hvac[${PYTHON_USEDEP}] )
	rules? ( dev-python/hvac[${PYTHON_USEDEP}] )
	all? ( dev-python/jsonata-python[${PYTHON_USEDEP}] )
	docs? ( dev-python/jsonata-python[${PYTHON_USEDEP}] )
	examples? ( dev-python/jsonata-python[${PYTHON_USEDEP}] )
	rules? ( dev-python/jsonata-python[${PYTHON_USEDEP}] )
	all? ( dev-python/jsonschema[${PYTHON_USEDEP}] )
	docs? ( dev-python/jsonschema[${PYTHON_USEDEP}] )
	examples? ( dev-python/jsonschema[${PYTHON_USEDEP}] )
	json? ( dev-python/jsonschema[${PYTHON_USEDEP}] )
	all? ( dev-python/opentelemetry-distro[${PYTHON_USEDEP}] )
	soaktest? ( dev-python/opentelemetry-distro[${PYTHON_USEDEP}] )
	all? ( dev-python/opentelemetry-exporter-otlp[${PYTHON_USEDEP}] )
	soaktest? ( dev-python/opentelemetry-exporter-otlp[${PYTHON_USEDEP}] )
	all? ( dev-python/protobuf[${PYTHON_USEDEP}] )
	docs? ( dev-python/protobuf[${PYTHON_USEDEP}] )
	examples? ( dev-python/protobuf[${PYTHON_USEDEP}] )
	protobuf? ( dev-python/protobuf[${PYTHON_USEDEP}] )
	all? ( dev-python/psutil[${PYTHON_USEDEP}] )
	soaktest? ( dev-python/psutil[${PYTHON_USEDEP}] )
	all? ( dev-python/pydantic[${PYTHON_USEDEP}] )
	examples? ( dev-python/pydantic[${PYTHON_USEDEP}] )
	all? ( dev-python/pyrsistent[${PYTHON_USEDEP}] )
	docs? ( dev-python/pyrsistent[${PYTHON_USEDEP}] )
	examples? ( dev-python/pyrsistent[${PYTHON_USEDEP}] )
	json? ( dev-python/pyrsistent[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pyyaml-6.0.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pyyaml-6.0.0[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/pyyaml-6.0.0[${PYTHON_USEDEP}] )
	rules? ( >=dev-python/pyyaml-6.0.0[${PYTHON_USEDEP}] )
	all? ( dev-python/requests[${PYTHON_USEDEP}] )
	avro? ( dev-python/requests[${PYTHON_USEDEP}] )
	docs? ( dev-python/requests[${PYTHON_USEDEP}] )
	examples? ( dev-python/requests[${PYTHON_USEDEP}] )
	all? ( dev-python/requests-mock[${PYTHON_USEDEP}] )
	all? ( dev-python/respx[${PYTHON_USEDEP}] )
	all? ( dev-python/six[${PYTHON_USEDEP}] )
	examples? ( dev-python/six[${PYTHON_USEDEP}] )
	all? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	all? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	all? ( dev-python/tink[${PYTHON_USEDEP}] )
	docs? ( dev-python/tink[${PYTHON_USEDEP}] )
	examples? ( dev-python/tink[${PYTHON_USEDEP}] )
	rules? ( dev-python/tink[${PYTHON_USEDEP}] )
	all? ( >=dev-python/urllib3-2.0.0[${PYTHON_USEDEP}] <dev-python/urllib3-3[${PYTHON_USEDEP}] )
	all? ( dev-python/uvicorn[${PYTHON_USEDEP}] )
	examples? ( dev-python/uvicorn[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/attrs[${PYTHON_USEDEP}]
		>=dev-python/avro-1.11.1[${PYTHON_USEDEP}] <dev-python/avro-2[${PYTHON_USEDEP}]
		dev-python/azure-identity[${PYTHON_USEDEP}]
		dev-python/azure-keyvault-keys[${PYTHON_USEDEP}]
		dev-python/boto3[${PYTHON_USEDEP}]
		dev-python/cachetools[${PYTHON_USEDEP}]
		>=dev-python/cel-python-0.1.5[${PYTHON_USEDEP}]
		dev-python/confluent-kafka[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		<dev-python/fastavro-2[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/google-api-core[${PYTHON_USEDEP}]
		dev-python/google-auth[${PYTHON_USEDEP}]
		dev-python/google-cloud-kms[${PYTHON_USEDEP}]
		dev-python/googleapis-common-protos[${PYTHON_USEDEP}]
		~dev-python/hkdf-0.0.3[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/hvac[${PYTHON_USEDEP}]
		dev-python/jsonata-python[${PYTHON_USEDEP}]
		dev-python/jsonschema[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/pyrsistent[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.0[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/requests-mock[${PYTHON_USEDEP}]
		dev-python/respx[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}]
		dev-python/tink[${PYTHON_USEDEP}]
		>=dev-python/urllib3-2.0.0[${PYTHON_USEDEP}] <dev-python/urllib3-3[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
