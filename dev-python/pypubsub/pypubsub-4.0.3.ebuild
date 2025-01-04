# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1
SRC_URI="https://github.com/schollii/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

DESCRIPTION="Python Publish-Subscribe Package"
HOMEPAGE="
  https://pypi.org/project/pypubsub/
"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND=""

EPYTEST_XDIST=1
distutils_enable_tests pytest
