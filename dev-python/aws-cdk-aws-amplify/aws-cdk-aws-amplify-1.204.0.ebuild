# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
PYPI_PN="aws-cdk.aws-amplify"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/aws-cdk-aws-amplify/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	aws-cdk.aws-codebuild (==1.204.0)
	aws-cdk.aws-codecommit (==1.204.0)
	aws-cdk.aws-iam (==1.204.0)
	aws-cdk.aws-kms (==1.204.0)
	aws-cdk.aws-lambda (==1.204.0)
	aws-cdk.aws-lambda-nodejs (==1.204.0)
	aws-cdk.aws-s3-assets (==1.204.0)
	aws-cdk.aws-secretsmanager (==1.204.0)
	aws-cdk.core (==1.204.0)
	aws-cdk.custom-resources (==1.204.0)
	constructs (<4.0.0,>=3.3.69)
	jsii (<2.0.0,>=1.84.0)
	publication (>=0.0.3)
	typeguard (~=2.13.3)
"
GENERATED_RDEPEND="${RDEPEND}
	~dev-python/aws-cdk-aws-codebuild-1.204.0[${PYTHON_USEDEP}]
	~dev-python/aws-cdk-aws-codecommit-1.204.0[${PYTHON_USEDEP}]
	~dev-python/aws-cdk-aws-iam-1.204.0[${PYTHON_USEDEP}]
	~dev-python/aws-cdk-aws-kms-1.204.0[${PYTHON_USEDEP}]
	~dev-python/aws-cdk-aws-lambda-1.204.0[${PYTHON_USEDEP}]
	~dev-python/aws-cdk-aws-lambda-nodejs-1.204.0[${PYTHON_USEDEP}]
	~dev-python/aws-cdk-aws-s3-assets-1.204.0[${PYTHON_USEDEP}]
	~dev-python/aws-cdk-aws-secretsmanager-1.204.0[${PYTHON_USEDEP}]
	~dev-python/aws-cdk-core-1.204.0[${PYTHON_USEDEP}]
	~dev-python/aws-cdk-custom-resources-1.204.0[${PYTHON_USEDEP}]
	>=dev-python/constructs-3.3.69[${PYTHON_USEDEP}] <dev-python/constructs-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/jsii-1.84.0[${PYTHON_USEDEP}] <dev-python/jsii-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/publication-0.0.3[${PYTHON_USEDEP}]
	>=dev-python/typeguard-2.13.3[${PYTHON_USEDEP}] =dev-python/typeguard-2.13*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
