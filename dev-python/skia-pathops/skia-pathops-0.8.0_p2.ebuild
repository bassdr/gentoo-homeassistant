# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.8.0.post2 .zip)"
S="${WORKDIR}/${PN}-0.8.0.post2"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/skia-pathops/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/coverage[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-randomly[${PYTHON_USEDEP}]
	dev-python/pytest-xdist[${PYTHON_USEDEP}]
)"
