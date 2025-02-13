# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} ${PV} .zip)"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/msrest/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/aiodns[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.0[${PYTHON_USEDEP}]
	>=dev-python/azure-core-1.24.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2017.4.17[${PYTHON_USEDEP}]
	>=dev-python/isodate-0.6.0[${PYTHON_USEDEP}]
	~dev-python/requests-2.16[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-0.5.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
