# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="carto-dw"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/carto-auth/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	google-auth ; extra == 'carto-dw'
	google-cloud-bigquery (>=2.34.4) ; extra == 'carto-dw'
	pyyaml
	requests
"
GENERATED_RDEPEND="${RDEPEND}
	carto-dw? ( dev-python/google-auth[${PYTHON_USEDEP}] )
	carto-dw? ( >=dev-python/google-cloud-bigquery-2.34.4[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
