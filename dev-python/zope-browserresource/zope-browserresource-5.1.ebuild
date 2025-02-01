# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="docs zcml"
IUSE="${GENERATED_IUSE}"

PYPI_PN="zope.browserresource"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zope.browserresource/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	docs? ( dev-python/repoze-sphinx-autointerface[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	>=dev-python/zope-component-3.8.0[${PYTHON_USEDEP}]
	zcml? ( dev-python/zope-component[zcml,${PYTHON_USEDEP}] )
	dev-python/zope-configuration[${PYTHON_USEDEP}]
	>=dev-python/zope-contenttype-4.0.1[${PYTHON_USEDEP}]
	dev-python/zope-i18n[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	dev-python/zope-location[${PYTHON_USEDEP}]
	>=dev-python/zope-publisher-3.8[${PYTHON_USEDEP}]
	dev-python/zope-schema[${PYTHON_USEDEP}]
	zcml? ( >=dev-python/zope-security-3.8[zcml,${PYTHON_USEDEP}] )
	>dev-python/zope-traversing-3.7[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/zope-component[zcml,${PYTHON_USEDEP}]
	>=dev-python/zope-security-3.8[zcml,${PYTHON_USEDEP}]
	dev-python/zope-testing[${PYTHON_USEDEP}]
	dev-python/zope-testrunner[${PYTHON_USEDEP}]
)"
