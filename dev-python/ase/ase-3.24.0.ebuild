# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="docs spglib test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ase/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/matplotlib-3.3.4[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.19.5[${PYTHON_USEDEP}]
	docs? ( dev-python/pillow[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-7.0.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-xdist-2.1.0[${PYTHON_USEDEP}] )
	>=dev-python/scipy-1.6.0[${PYTHON_USEDEP}]
	spglib? ( >=dev-python/spglib-1.9[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest