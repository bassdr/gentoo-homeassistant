# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 4.2.post3)"
S="${WORKDIR}/${PN}-4.2.post3"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jupyterlab-language-pack-zh-cn/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND=""

distutils_enable_tests pytest
