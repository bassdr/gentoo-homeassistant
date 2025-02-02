# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/crepe/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/h5py[${PYTHON_USEDEP}]
	>=dev-python/hmmlearn-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/imageio-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/resampy-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/scikit-learn-0.16[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
