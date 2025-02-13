# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/awslogs/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/boto3-1.5.0[${PYTHON_USEDEP}]
	<dev-python/jmespath-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/termcolor-1.1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
