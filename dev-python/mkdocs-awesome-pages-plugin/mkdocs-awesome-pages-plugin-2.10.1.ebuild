# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocs-awesome-pages-plugin/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	mkdocs>=1
	natsort>=8.1.0
	wcmatch>=7
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/mkdocs-1[${PYTHON_USEDEP}]
	>=dev-python/natsort-8.1.0[${PYTHON_USEDEP}]
	>=dev-python/wcmatch-7[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
