# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
PYPI_PN="ZODB"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ZODB/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/btrees-4.2.0[${PYTHON_USEDEP}]
	docs? ( dev-python/j1m-sphinxautozconfig[${PYTHON_USEDEP}] )
	>=dev-python/persistent-4.4.0[${PYTHON_USEDEP}]
	docs? ( <dev-python/sphinx-7[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-zopeext[${PYTHON_USEDEP}] )
	>=dev-python/transaction-2.4[${PYTHON_USEDEP}]
	dev-python/zc-lockfile[${PYTHON_USEDEP}]
	dev-python/zconfig[${PYTHON_USEDEP}]
	docs? ( dev-python/zodb[${PYTHON_USEDEP}] )
	>=dev-python/zodbpickle-1.0.1[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/manuel[${PYTHON_USEDEP}]
	dev-python/zope-testing[${PYTHON_USEDEP}]
	>=dev-python/zope-testrunner-4.4.6[${PYTHON_USEDEP}]
)"
