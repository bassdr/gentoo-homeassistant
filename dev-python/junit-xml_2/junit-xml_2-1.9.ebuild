# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
PYPI_PN="junit-xml-2"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/junit-xml-2/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	six
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/six[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
