# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="adlfs azureml connectors-aws connectors-azure connectors-gcp connectors-kubernetes gcsfs s3fs sagemaker secrets-aws secrets-azure secrets-gcp secrets-hashicorp server templates vertex"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zenml/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	adlfs? ( >=dev-python/adlfs-2021.10.0[${PYTHON_USEDEP}] )
	<dev-python/alembic-1.9.0[${PYTHON_USEDEP}]
	connectors-aws? ( >=dev-python/aws-profile-manager-0.5.0[${PYTHON_USEDEP}] )
	azureml? ( ~dev-python/azure-ai-ml-1.23.1[${PYTHON_USEDEP}] )
	secrets-azure? ( >=dev-python/azure-identity-1.4.0[${PYTHON_USEDEP}] )
	secrets-azure? ( >=dev-python/azure-keyvault-secrets-4.0.0[${PYTHON_USEDEP}] )
	connectors-azure? ( >=dev-python/azure-mgmt-containerregistry-10.0.0[${PYTHON_USEDEP}] )
	connectors-azure? ( >=dev-python/azure-mgmt-containerservice-20.0.0[${PYTHON_USEDEP}] )
	connectors-azure? ( >=dev-python/azure-mgmt-resource-21.0.0[${PYTHON_USEDEP}] )
	connectors-azure? ( >=dev-python/azure-mgmt-storage-20.0.0[${PYTHON_USEDEP}] )
	connectors-azure? ( >=dev-python/azure-storage-blob-12.0.0[${PYTHON_USEDEP}] )
	~dev-python/bcrypt-4.0.1[${PYTHON_USEDEP}]
	secrets-aws? ( >=dev-python/boto3-1.16.0[${PYTHON_USEDEP}] )
	<dev-python/click-8.1.4[${PYTHON_USEDEP}]
	<dev-python/cloudpickle-3[${PYTHON_USEDEP}]
	templates? ( >=dev-python/copier-8.1.0[${PYTHON_USEDEP}] )
	<dev-python/distro-2.0.0[${PYTHON_USEDEP}]
	<dev-python/docker-7.2.0[${PYTHON_USEDEP}]
	server? ( <=dev-python/fastapi-0.110[${PYTHON_USEDEP}] )
	gcsfs? ( >=dev-python/gcsfs-2022.11.0[${PYTHON_USEDEP}] )
	<dev-python/gitpython-4.0.0[${PYTHON_USEDEP}]
	vertex? ( >=dev-python/google-cloud-aiplatform-1.34.0[${PYTHON_USEDEP}] )
	connectors-gcp? ( >=dev-python/google-cloud-artifact-registry-1.11.3[${PYTHON_USEDEP}] )
	connectors-gcp? ( >=dev-python/google-cloud-container-2.21.0[${PYTHON_USEDEP}] )
	secrets-gcp? ( >=dev-python/google-cloud-secret-manager-2.12.5[${PYTHON_USEDEP}] )
	connectors-gcp? ( >=dev-python/google-cloud-storage-2.9.0[${PYTHON_USEDEP}] )
	secrets-hashicorp? ( >=dev-python/hvac-0.11.2[${PYTHON_USEDEP}] )
	server? ( >=dev-python/ipinfo-4.4.3[${PYTHON_USEDEP}] )
	server? ( <dev-python/itsdangerous-2.3.0[${PYTHON_USEDEP}] )
	server? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	templates? ( <dev-python/jinja2-time-0.3.0[${PYTHON_USEDEP}] )
	vertex? ( >=dev-python/kfp-2.6.0[${PYTHON_USEDEP}] )
	connectors-kubernetes? ( >=dev-python/kubernetes-18.20.0[${PYTHON_USEDEP}] )
	server? ( <dev-python/orjson-3.11.0[${PYTHON_USEDEP}] )
	>=dev-python/packaging-24.1[${PYTHON_USEDEP}]
	<dev-python/passlib-1.8.0[bcrypt,${PYTHON_USEDEP}]
	>=dev-python/psutil-5.0.0[${PYTHON_USEDEP}]
	<dev-python/pydantic-2.9[${PYTHON_USEDEP}]
	dev-python/pydantic-settings[${PYTHON_USEDEP}]
	server? ( ~dev-python/pyjwt-2.7*[crypto,${PYTHON_USEDEP}] )
	<dev-python/pymysql-1.2.0[${PYTHON_USEDEP}]
	<dev-python/python-dateutil-3.0.0[${PYTHON_USEDEP}]
	server? ( <dev-python/python-multipart-0.1.0[${PYTHON_USEDEP}] )
	>=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}]
	templates? ( <dev-python/pyyaml-include-2.0[${PYTHON_USEDEP}] )
	>=dev-python/rich-12.0.0[jupyter,${PYTHON_USEDEP}]
	templates? ( >=dev-python/ruff-0.1.7[${PYTHON_USEDEP}] )
	s3fs? ( >=dev-python/s3fs-2022.11.0[${PYTHON_USEDEP}] )
	sagemaker? ( >=dev-python/sagemaker-2.117.0[${PYTHON_USEDEP}] )
	server? ( <dev-python/secure-0.4.0[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	<dev-python/sqlalchemy-3.0.0[${PYTHON_USEDEP}]
	dev-python/sqlalchemy-utils[${PYTHON_USEDEP}]
	~dev-python/sqlmodel-0.0.18[${PYTHON_USEDEP}]
	server? ( <dev-python/tldextract-5.2.0[${PYTHON_USEDEP}] )
	server? ( >=dev-python/uvicorn-0.17.5[standard,${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	<dev-python/bandit-2.0.0[${PYTHON_USEDEP}]
	<dev-python/coverage-6.0[toml,${PYTHON_USEDEP}]
	<dev-python/darglint-2.0.0[${PYTHON_USEDEP}]
	<dev-python/hypothesis-7.0.0[${PYTHON_USEDEP}]
	<dev-python/maison-2.0[${PYTHON_USEDEP}]
	<dev-python/mike-2.0.0[${PYTHON_USEDEP}]
	<dev-python/mkdocs-2.0.0[${PYTHON_USEDEP}]
	<dev-python/mkdocs-awesome-pages-plugin-3.0.0[${PYTHON_USEDEP}]
	<dev-python/mkdocs-material-9.0.0[${PYTHON_USEDEP}]
	<dev-python/mkdocstrings-0.18.0[${PYTHON_USEDEP}]
	~dev-python/mypy-1.7.1[${PYTHON_USEDEP}]
	<dev-python/pyment-0.4.0[${PYTHON_USEDEP}]
	<dev-python/pytest-8.0.0[${PYTHON_USEDEP}]
	<dev-python/pytest-clarity-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-instafail-0.5.0[${PYTHON_USEDEP}]
	<dev-python/pytest-mock-4.0.0[${PYTHON_USEDEP}]
	<dev-python/pytest-randomly-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-rerunfailures-13.0[${PYTHON_USEDEP}]
	<dev-python/pytest-split-0.9.0[${PYTHON_USEDEP}]
	<dev-python/tox-4.0.0[${PYTHON_USEDEP}]
	<dev-python/types-certifi-2022.0.0.0[${PYTHON_USEDEP}]
	<dev-python/types-croniter-2.0.0[${PYTHON_USEDEP}]
	<dev-python/types-futures-4.0.0[${PYTHON_USEDEP}]
	<dev-python/types-markdown-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/types-paramiko-3.4.0[${PYTHON_USEDEP}]
	<dev-python/types-passlib-2.0.0[${PYTHON_USEDEP}]
	<dev-python/types-pillow-10.0.0[${PYTHON_USEDEP}]
	<dev-python/types-protobuf-4.0.0[${PYTHON_USEDEP}]
	<dev-python/types-psutil-6.0.0[${PYTHON_USEDEP}]
	<dev-python/types-pymysql-2.0.0[${PYTHON_USEDEP}]
	<dev-python/types-python-dateutil-3.0.0[${PYTHON_USEDEP}]
	<dev-python/types-python-slugify-6.0.0[${PYTHON_USEDEP}]
	<dev-python/types-pyyaml-7.0.0[${PYTHON_USEDEP}]
	<dev-python/types-redis-5.0.0[${PYTHON_USEDEP}]
	<dev-python/types-requests-3.0.0[${PYTHON_USEDEP}]
	<dev-python/types-setuptools-58.0.0[${PYTHON_USEDEP}]
	<dev-python/types-six-2.0.0[${PYTHON_USEDEP}]
	<dev-python/types-termcolor-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7.4[${PYTHON_USEDEP}]
	<dev-python/yamlfix-2.0.0[${PYTHON_USEDEP}]
)"
