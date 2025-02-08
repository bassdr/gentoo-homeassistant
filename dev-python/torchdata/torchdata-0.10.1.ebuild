# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/torchdata/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	requests
	torch>=2
	urllib3>=1.25
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/torch-2[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
