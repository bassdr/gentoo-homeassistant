# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} ${PV} .zip)"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/wget/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND=""

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	app-arch/unzip
"
BDEPEND="${GENERATED_BDEPEND}"
