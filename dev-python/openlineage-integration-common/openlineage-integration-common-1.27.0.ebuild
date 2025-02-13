# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="bigquery dbt dev-no-parser great-expectations redshift"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/openlineage-integration-common/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/attrs-19.3.0[${PYTHON_USEDEP}]
	dev-no-parser? ( >=dev-python/boto3-1.15.0[${PYTHON_USEDEP}] )
	redshift? ( >=dev-python/boto3-1.15.0[${PYTHON_USEDEP}] )
	dbt? ( >=dev-python/dbt-core-0.20.0[${PYTHON_USEDEP}] )
	dev-no-parser? ( >=dev-python/dbt-core-0.20.0[${PYTHON_USEDEP}] )
	bigquery? ( >=dev-python/google-api-core-1.26.3[${PYTHON_USEDEP}] )
	dev-no-parser? ( >=dev-python/google-api-core-1.26.3[${PYTHON_USEDEP}] )
	bigquery? ( >=dev-python/google-auth-1.30.0[${PYTHON_USEDEP}] )
	dev-no-parser? ( >=dev-python/google-auth-1.30.0[${PYTHON_USEDEP}] )
	bigquery? ( <dev-python/google-cloud-bigquery-4.0.0[${PYTHON_USEDEP}] )
	dev-no-parser? ( <dev-python/google-cloud-bigquery-4.0.0[${PYTHON_USEDEP}] )
	bigquery? ( >=dev-python/google-cloud-core-1.6.0[${PYTHON_USEDEP}] )
	dev-no-parser? ( >=dev-python/google-cloud-core-1.6.0[${PYTHON_USEDEP}] )
	bigquery? ( >=dev-python/google-crc32c-1.1.2[${PYTHON_USEDEP}] )
	dev-no-parser? ( >=dev-python/google-crc32c-1.1.2[${PYTHON_USEDEP}] )
	dev-no-parser? ( <dev-python/great-expectations-0.15.35[${PYTHON_USEDEP}] )
	great-expectations? ( <dev-python/great-expectations-0.15.35[${PYTHON_USEDEP}] )
	dev-no-parser? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	dev-no-parser? ( dev-python/mock[${PYTHON_USEDEP}] )
	dev-no-parser? ( >=dev-python/mypy-0.960[${PYTHON_USEDEP}] )
	~dev-python/openlineage-python-1.27.0[${PYTHON_USEDEP}]
	~dev-python/openlineage-sql-1.27.0[${PYTHON_USEDEP}]
	dev-no-parser? ( dev-python/pandas[${PYTHON_USEDEP}] )
	dev-no-parser? ( dev-python/pytest[${PYTHON_USEDEP}] )
	dev-no-parser? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	dev-no-parser? ( dev-python/pytest-mock[${PYTHON_USEDEP}] )
	dev-no-parser? ( dev-python/python-dateutil[${PYTHON_USEDEP}] )
	dbt? ( >=dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}] )
	dev-no-parser? ( >=dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}] )
	dev-no-parser? ( <dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}] )
	great-expectations? ( <dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}] )
	dev-no-parser? ( dev-python/types-python-dateutil[${PYTHON_USEDEP}] )
	dev-no-parser? ( dev-python/types-pyyaml[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/boto3-1.15.0[${PYTHON_USEDEP}]
	>=dev-python/dbt-core-0.20.0[${PYTHON_USEDEP}]
	>=dev-python/google-api-core-1.26.3[${PYTHON_USEDEP}]
	>=dev-python/google-auth-1.30.0[${PYTHON_USEDEP}]
	<dev-python/google-cloud-bigquery-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-core-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/google-crc32c-1.1.2[${PYTHON_USEDEP}]
	<dev-python/great-expectations-0.15.35[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]
	>=dev-python/mypy-0.960[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/pytest-mock[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}]
	<dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}]
	dev-python/types-python-dateutil[${PYTHON_USEDEP}]
	dev-python/types-pyyaml[${PYTHON_USEDEP}]
)"
