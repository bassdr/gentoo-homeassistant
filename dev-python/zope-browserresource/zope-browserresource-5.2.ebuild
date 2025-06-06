# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs test zcml"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zope-browserresource/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Sphinx; extra == 'docs'
	repoze.sphinx.autointerface; extra == 'docs'
	setuptools
	zope.component>=3.8.0
	zope.component[zcml]; extra == 'test'
	zope.component[zcml]; extra == 'zcml'
	zope.configuration
	zope.contenttype>=4.0.1
	zope.i18n
	zope.interface
	zope.location
	zope.publisher>=3.8
	zope.schema
	zope.security[zcml]>=3.8; extra == 'test'
	zope.security[zcml]>=3.8; extra == 'zcml'
	zope.testing; extra == 'test'
	zope.testrunner; extra == 'test'
	zope.traversing>3.7
"
GENERATED_RDEPEND="${RDEPEND}
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
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/zope-component[zcml,${PYTHON_USEDEP}]
		>=dev-python/zope-security-3.8[zcml,${PYTHON_USEDEP}]
		dev-python/zope-testing[${PYTHON_USEDEP}]
		dev-python/zope-testrunner[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
