# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="sphinx"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-togglebutton/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	dev-python/docutils[${PYTHON_USEDEP}]
	sphinx? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	sphinx? ( dev-python/myst-nb[${PYTHON_USEDEP}] )
	sphinx? ( dev-python/numpy[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
	sphinx? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	sphinx? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	sphinx? ( dev-python/sphinx-examples[${PYTHON_USEDEP}] )
	dev-python/wheel[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
