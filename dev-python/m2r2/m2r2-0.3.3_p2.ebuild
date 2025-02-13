# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.3.3.post2)"
S="${WORKDIR}/${PN}-0.3.3.post2"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/m2r2/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/docutils-0.19[${PYTHON_USEDEP}]
	~dev-python/mistune-0.8.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
