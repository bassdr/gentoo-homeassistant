# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all aws-iam"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/lakefs/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	boto3>=1.26.0; extra == 'all'
	boto3>=1.26.0; extra == 'aws-iam'
	lakefs-sdk<2,>=1.47
	pyyaml~=6.0.1
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( >=dev-python/boto3-1.26.0[${PYTHON_USEDEP}] )
	aws-iam? ( >=dev-python/boto3-1.26.0[${PYTHON_USEDEP}] )
	>=dev-python/lakefs-sdk-1.47[${PYTHON_USEDEP}] <dev-python/lakefs-sdk-2[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}] =dev-python/pyyaml-6.0*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
