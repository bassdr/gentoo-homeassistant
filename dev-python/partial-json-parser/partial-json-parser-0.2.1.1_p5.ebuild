# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="playground"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

SRC_URI="$(pypi_sdist_url --no-normalize "partial-json-parser" "0.2.1.1.post5")"
S="${WORKDIR}/partial-json-parser-0.2.1.1.post5"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/partial-json-parser/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	playground? ( dev-python/rich[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest