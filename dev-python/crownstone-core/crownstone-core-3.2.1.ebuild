# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="UNKNOWN"
HOMEPAGE="
  https://pypi.org/project/crownstone-core/
"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	pyaes (~=1.6)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pyaes-1.6[${PYTHON_USEDEP}] =dev-python/pyaes-1*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
