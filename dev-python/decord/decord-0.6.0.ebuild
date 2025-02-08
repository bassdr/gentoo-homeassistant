# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1
SRC_URI="https://github.com/dmlc/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/decord/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	numpy (>=1.14.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/numpy-1.14.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
