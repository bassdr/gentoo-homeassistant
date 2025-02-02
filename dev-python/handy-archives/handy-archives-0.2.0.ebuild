# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/handy-archives/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	all? ( >=dev-python/coincidence-0.2.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-6.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/coincidence-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-6.0.0[${PYTHON_USEDEP}]
)"
