# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"

PYPI_PN="zope.authentication"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zope.authentication/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	docs? ( dev-python/repoze-sphinx-autointerface[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	dev-python/zope-browser[${PYTHON_USEDEP}]
	>=dev-python/zope-component-3.6.0[${PYTHON_USEDEP}]
	dev-python/zope-i18nmessageid[${PYTHON_USEDEP}]
	>=dev-python/zope-interface-3.8[${PYTHON_USEDEP}]
	dev-python/zope-schema[${PYTHON_USEDEP}]
	dev-python/zope-security[${PYTHON_USEDEP}]
	test? ( dev-python/zope-testing[${PYTHON_USEDEP}] )
	test? ( dev-python/zope-testrunner[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest