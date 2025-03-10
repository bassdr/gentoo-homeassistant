# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/spacy-thai/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	deplacy>=2.1.0
	pythainlp>=2.3.2
	spacy>=2.2.2
	ufal.udpipe>=1.2.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/deplacy-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/pythainlp-2.3.2[${PYTHON_USEDEP}]
	>=dev-python/spacy-2.2.2[${PYTHON_USEDEP}]
	>=dev-python/ufal-udpipe-1.2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
