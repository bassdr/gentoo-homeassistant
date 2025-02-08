# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_PN="zc.customdoctests"
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url --no-normalize ${PYPI_PN} ${PV} .zip)"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zc-customdoctests/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"


distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	app-arch/unzip
"
BDEPEND="${GENERATED_BDEPEND}"
