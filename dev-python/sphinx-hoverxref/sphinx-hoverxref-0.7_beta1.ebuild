# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
IUSE=""

inherit distutils-r1 pypi

SRC_URI="$(pypi_sdist_url --no-normalize "sphinx-hoverxref" "0.7b1")"
S="${WORKDIR}/sphinx-hoverxref-0.7b1"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-hoverxref/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND=""

distutils_enable_tests pytest