# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/azure-mgmt-containerregistry/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	azure-common~=1.1
	azure-mgmt-core<2.0.0,>=1.3.2
	isodate<1.0.0,>=0.6.1
	typing-extensions>=4.3.0; python_version < '3.8.0'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/azure-common-1.1[${PYTHON_USEDEP}] =dev-python/azure-common-1*[${PYTHON_USEDEP}]
	>=dev-python/azure-mgmt-core-1.3.2[${PYTHON_USEDEP}] <dev-python/azure-mgmt-core-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/isodate-0.6.1[${PYTHON_USEDEP}] <dev-python/isodate-1.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
