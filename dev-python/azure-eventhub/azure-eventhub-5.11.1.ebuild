# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url --no-normalize ${PN} ${PV} .zip)"

DESCRIPTION="Microsoft Azure Event Hubs Client Library for Python"
HOMEPAGE="
  https://pypi.org/project/azure-eventhub/
"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_DEPEND="${RDEPEND}
	<dev-python/azure-core-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"
BDEPEND="app-arch/unzip"

EPYTEST_XDIST=1
distutils_enable_tests pytest
