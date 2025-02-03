# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

PYPI_NO_NORMALIZE=1
PYPI_PN="aws-cdk.aws-route53-targets"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/aws-cdk.aws-route53-targets/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	=dev-python/aws-cdk-aws-apigateway-1.204.0[${PYTHON_USEDEP}]
	=dev-python/aws-cdk-aws-cloudfront-1.204.0[${PYTHON_USEDEP}]
	=dev-python/aws-cdk-aws-cognito-1.204.0[${PYTHON_USEDEP}]
	=dev-python/aws-cdk-aws-ec2-1.204.0[${PYTHON_USEDEP}]
	=dev-python/aws-cdk-aws-elasticloadbalancing-1.204.0[${PYTHON_USEDEP}]
	=dev-python/aws-cdk-aws-elasticloadbalancingv2-1.204.0[${PYTHON_USEDEP}]
	=dev-python/aws-cdk-aws-globalaccelerator-1.204.0[${PYTHON_USEDEP}]
	=dev-python/aws-cdk-aws-iam-1.204.0[${PYTHON_USEDEP}]
	=dev-python/aws-cdk-aws-route53-1.204.0[${PYTHON_USEDEP}]
	=dev-python/aws-cdk-aws-s3-1.204.0[${PYTHON_USEDEP}]
	=dev-python/aws-cdk-core-1.204.0[${PYTHON_USEDEP}]
	=dev-python/aws-cdk-region-info-1.204.0[${PYTHON_USEDEP}]
	<dev-python/constructs-4.0.0[${PYTHON_USEDEP}]
	<dev-python/jsii-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/publication-0.0.3[${PYTHON_USEDEP}]
	>=dev-python/typeguard-2.13.3[${PYTHON_USEDEP}] =dev-python/typeguard-2.13*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
