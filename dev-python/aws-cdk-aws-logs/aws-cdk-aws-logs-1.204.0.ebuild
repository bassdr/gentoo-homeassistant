# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
IUSE=""

PYPI_PN="aws-cdk.aws-logs"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/aws-cdk.aws-logs/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	~dev-python/aws-cdk-aws-cloudwatch-1.204.0[${PYTHON_USEDEP}]
	~dev-python/aws-cdk-aws-iam-1.204.0[${PYTHON_USEDEP}]
	~dev-python/aws-cdk-aws-kms-1.204.0[${PYTHON_USEDEP}]
	~dev-python/aws-cdk-aws-s3-assets-1.204.0[${PYTHON_USEDEP}]
	~dev-python/aws-cdk-core-1.204.0[${PYTHON_USEDEP}]
	~dev-python/aws-cdk-cx-api-1.204.0[${PYTHON_USEDEP}]
	<dev-python/constructs-4.0.0[${PYTHON_USEDEP}]
	<dev-python/jsii-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/publication-0.0.3[${PYTHON_USEDEP}]
	~dev-python/typeguard-2.13.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest