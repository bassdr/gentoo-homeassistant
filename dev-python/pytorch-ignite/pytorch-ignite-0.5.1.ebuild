# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytorch-ignite/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	packaging
	torch<3,>=1.3
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/torch-1.3[${PYTHON_USEDEP}] <dev-python/torch-3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
