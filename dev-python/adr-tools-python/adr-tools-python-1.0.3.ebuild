# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1
SRC_URI="https://bitbucket.org/tinkerer_/${PN}/get/${PV}.tar.bz2 -> ${P}.bb.tar.bz2"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/adr-tools-python/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	argparse
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/argparse[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
