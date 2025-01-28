# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/albucore/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/numpy-1.24.4[${PYTHON_USEDEP}]
	>=dev-python/opencv-python-headless-4.9.0.80[${PYTHON_USEDEP}]
	>=dev-python/simsimd-5.9.2[${PYTHON_USEDEP}]
	>=dev-python/stringzilla-3.10.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest