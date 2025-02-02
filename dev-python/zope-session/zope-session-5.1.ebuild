# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
PYPI_PN="zope.session"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zope.session/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	docs? ( dev-python/repoze-sphinx-autointerface[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	>=dev-python/zodb-4.2.0.b1[${PYTHON_USEDEP}]
	dev-python/zope-component[${PYTHON_USEDEP}]
	>=dev-python/zope-i18nmessageid-4.0.3[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	dev-python/zope-location[${PYTHON_USEDEP}]
	dev-python/zope-minmax[${PYTHON_USEDEP}]
	>=dev-python/zope-publisher-4.1.0[${PYTHON_USEDEP}]
	dev-python/zope-traversing[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/zope-configuration[${PYTHON_USEDEP}]
	dev-python/zope-testing[${PYTHON_USEDEP}]
	dev-python/zope-testrunner[${PYTHON_USEDEP}]
)"
