# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/funowl/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/bcp47[${PYTHON_USEDEP}]
	dev-python/jsonasobj[${PYTHON_USEDEP}]
	>=dev-python/pyjsg-0.11.6[${PYTHON_USEDEP}]
	<dev-python/rdflib-8[${PYTHON_USEDEP}]
	dev-python/rdflib-shim[${PYTHON_USEDEP}]
	dev-python/rfc3987[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest