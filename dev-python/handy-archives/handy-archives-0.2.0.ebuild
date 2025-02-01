# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all testing"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/handy-archives/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	all? ( >=dev-python/coincidence-0.2.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/coincidence-0.2.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-6.0.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-6.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
