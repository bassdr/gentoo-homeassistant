# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="unidic unidic-lite"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mecab-python3/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	unidic-lite; extra == 'unidic-lite'
	unidic; extra == 'unidic'
"
GENERATED_RDEPEND="${RDEPEND}
	unidic? ( dev-python/unidic[${PYTHON_USEDEP}] )
	unidic-lite? ( dev-python/unidic-lite[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
