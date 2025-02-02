# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/lpips/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/numpy-1.14.3[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/torch-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/torchvision-0.2.1[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.28.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
