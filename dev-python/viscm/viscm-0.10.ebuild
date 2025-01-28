# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="pyqt pyside"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/viscm/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	~dev-python/colorspacious-1.1[${PYTHON_USEDEP}]
	~dev-python/matplotlib-3.5[${PYTHON_USEDEP}]
	~dev-python/numpy-1.22[${PYTHON_USEDEP}]
	pyqt? ( dev-python/pyqt6[${PYTHON_USEDEP}] )
	pyside? ( dev-python/pyside6[${PYTHON_USEDEP}] )
	~dev-python/scipy-1.8[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest