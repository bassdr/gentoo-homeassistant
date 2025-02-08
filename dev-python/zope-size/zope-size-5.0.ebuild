# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs zcml"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
PYPI_PN="zope.size"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zope-size/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Sphinx ; extra == 'docs'
	repoze.sphinx.autointerface ; extra == 'docs'
	setuptools
	zope.component[zcml] ; extra == 'test'
	zope.component[zcml] ; extra == 'zcml'
	zope.configuration ; extra == 'test'
	zope.configuration ; extra == 'zcml'
	zope.i18nmessageid
	zope.interface
	zope.security[zcml] ; extra == 'test'
	zope.security[zcml] ; extra == 'zcml'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/repoze-sphinx-autointerface[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	zcml? ( dev-python/zope-component[zcml,${PYTHON_USEDEP}] )
	zcml? ( dev-python/zope-configuration[${PYTHON_USEDEP}] )
	dev-python/zope-i18nmessageid[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	zcml? ( dev-python/zope-security[zcml,${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/zope-component[zcml,${PYTHON_USEDEP}]
		dev-python/zope-configuration[${PYTHON_USEDEP}]
		dev-python/zope-security[zcml,${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
