# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="component copy docs test test-component test-minimal zcml"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zope-location/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Sphinx; extra == 'docs'
	repoze.sphinx.autointerface; extra == 'docs'
	setuptools
	zope.component>=4.0.1; extra == 'component'
	zope.component>=4.0.1; extra == 'docs'
	zope.component>=4.0.1; extra == 'test'
	zope.component>=4.0.1; extra == 'test-component'
	zope.configuration; extra == 'docs'
	zope.configuration; extra == 'test'
	zope.configuration; extra == 'test-component'
	zope.configuration; extra == 'zcml'
	zope.copy>=4.0; extra == 'copy'
	zope.copy>=4.0; extra == 'test'
	zope.interface>=4.0.2
	zope.proxy>=4.0.1
	zope.schema>=4.2.2
	zope.testrunner; extra == 'test'
	zope.testrunner; extra == 'test-component'
	zope.testrunner; extra == 'test-minimal'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/repoze-sphinx-autointerface[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	component? ( >=dev-python/zope-component-4.0.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/zope-component-4.0.1[${PYTHON_USEDEP}] )
	test-component? ( >=dev-python/zope-component-4.0.1[${PYTHON_USEDEP}] )
	docs? ( dev-python/zope-configuration[${PYTHON_USEDEP}] )
	test-component? ( dev-python/zope-configuration[${PYTHON_USEDEP}] )
	zcml? ( dev-python/zope-configuration[${PYTHON_USEDEP}] )
	copy? ( >=dev-python/zope-copy-4.0[${PYTHON_USEDEP}] )
	>=dev-python/zope-interface-4.0.2[${PYTHON_USEDEP}]
	>=dev-python/zope-proxy-4.0.1[${PYTHON_USEDEP}]
	>=dev-python/zope-schema-4.2.2[${PYTHON_USEDEP}]
	test-component? ( dev-python/zope-testrunner[${PYTHON_USEDEP}] )
	test-minimal? ( dev-python/zope-testrunner[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/zope-component-4.0.1[${PYTHON_USEDEP}]
		dev-python/zope-configuration[${PYTHON_USEDEP}]
		>=dev-python/zope-copy-4.0[${PYTHON_USEDEP}]
		dev-python/zope-testrunner[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
