# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 1.10.1.post20200504175005)"
S="${WORKDIR}/${PN}-1.10.1.post20200504175005"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cloud-sptheme/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"


distutils_enable_tests pytest
