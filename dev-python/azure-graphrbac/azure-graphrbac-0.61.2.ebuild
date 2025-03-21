# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/azure-graphrbac/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	azure-common~=1.1
	azure-nspkg; python_version < '3.0'
	msrest>=0.6.21
	msrestazure<2.0.0,>=0.4.32
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/azure-common-1.1[${PYTHON_USEDEP}] =dev-python/azure-common-1*[${PYTHON_USEDEP}]
	>=dev-python/msrest-0.6.21[${PYTHON_USEDEP}]
	>=dev-python/msrestazure-0.4.32[${PYTHON_USEDEP}] <dev-python/msrestazure-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
