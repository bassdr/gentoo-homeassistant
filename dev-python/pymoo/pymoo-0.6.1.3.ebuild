# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pymoo/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	dev-python/alive-progress[${PYTHON_USEDEP}]
	>=dev-python/autograd-1.4[${PYTHON_USEDEP}]
	=dev-python/cma-3.2.2[${PYTHON_USEDEP}]
	dev-python/deprecated[${PYTHON_USEDEP}]
	dev-python/dill[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.15[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
