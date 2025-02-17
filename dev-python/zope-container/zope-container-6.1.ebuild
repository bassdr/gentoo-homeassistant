# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs zcml zodb"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zope-container/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	BTrees
	Sphinx; extra == 'docs'
	ZODB>=3.10; extra == 'test'
	ZODB>=3.10; extra == 'zodb'
	persistent>=4.1.0
	repoze.sphinx.autointerface; extra == 'docs'
	setuptools
	sphinx_rtd_theme; extra == 'docs'
	zope.cachedescriptors
	zope.component
	zope.component[zcml]; extra == 'test'
	zope.component[zcml]; extra == 'zcml'
	zope.configuration; extra == 'test'
	zope.configuration; extra == 'zcml'
	zope.deferredimport
	zope.dottedname
	zope.event
	zope.filerepresentation
	zope.i18nmessageid
	zope.interface
	zope.lifecycleevent>=3.5.2
	zope.location>=3.5.4
	zope.proxy>=4.1.5
	zope.publisher
	zope.schema
	zope.security
	zope.security[zcml]>=4.0.0a3; extra == 'test'
	zope.security[zcml]>=4.0.0a3; extra == 'zcml'
	zope.size
	zope.testing; extra == 'test'
	zope.testrunner; extra == 'test'
	zope.traversing>=4.0.0a1
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/btrees[${PYTHON_USEDEP}]
	>=dev-python/persistent-4.1.0[${PYTHON_USEDEP}]
	docs? ( dev-python/repoze-sphinx-autointerface[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	zodb? ( >=dev-python/zodb-3.10[${PYTHON_USEDEP}] )
	dev-python/zope-cachedescriptors[${PYTHON_USEDEP}]
	dev-python/zope-component[${PYTHON_USEDEP}]
	zcml? ( dev-python/zope-component[zcml,${PYTHON_USEDEP}] )
	zcml? ( dev-python/zope-configuration[${PYTHON_USEDEP}] )
	dev-python/zope-deferredimport[${PYTHON_USEDEP}]
	dev-python/zope-dottedname[${PYTHON_USEDEP}]
	dev-python/zope-event[${PYTHON_USEDEP}]
	dev-python/zope-filerepresentation[${PYTHON_USEDEP}]
	dev-python/zope-i18nmessageid[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	>=dev-python/zope-lifecycleevent-3.5.2[${PYTHON_USEDEP}]
	>=dev-python/zope-location-3.5.4[${PYTHON_USEDEP}]
	>=dev-python/zope-proxy-4.1.5[${PYTHON_USEDEP}]
	dev-python/zope-publisher[${PYTHON_USEDEP}]
	dev-python/zope-schema[${PYTHON_USEDEP}]
	dev-python/zope-security[${PYTHON_USEDEP}]
	zcml? ( >=dev-python/zope-security-4.0.0_alpha3[zcml,${PYTHON_USEDEP}] )
	dev-python/zope-size[${PYTHON_USEDEP}]
	>=dev-python/zope-traversing-4.0.0_alpha1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/zodb-3.10[${PYTHON_USEDEP}]
		dev-python/zope-component[zcml,${PYTHON_USEDEP}]
		dev-python/zope-configuration[${PYTHON_USEDEP}]
		>=dev-python/zope-security-4.0.0_alpha3[zcml,${PYTHON_USEDEP}]
		dev-python/zope-testing[${PYTHON_USEDEP}]
		dev-python/zope-testrunner[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
