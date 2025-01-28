# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ipympl/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	<dev-python/ipython-9[${PYTHON_USEDEP}]
	<dev-python/ipywidgets-9[${PYTHON_USEDEP}]
	<dev-python/matplotlib-4[${PYTHON_USEDEP}]
	docs? ( dev-python/myst-nb[${PYTHON_USEDEP}] )
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-1.5[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-thebe[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-togglebutton[${PYTHON_USEDEP}] )
	<dev-python/traitlets-6[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest