# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/azure-datalake-store/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	azure-nspkg ; python_version<'3.0'
	cffi
	futures ; python_version<='2.7'
	msal (<2,>=1.16.0)
	pathlib2 ; python_version<'3.4'
	requests (>=2.20.0)
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/cffi[${PYTHON_USEDEP}]
	>=dev-python/msal-1.16.0[${PYTHON_USEDEP}] <dev-python/msal-2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
