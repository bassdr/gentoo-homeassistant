# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
PYPI_PN="zope.dublincore"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zope-dublincore/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	BTrees ; extra == 'test'
	BTrees ; extra == 'testing'
	Sphinx ; extra == 'docs'
	persistent
	pytz
	repoze.sphinx.autointerface ; extra == 'docs'
	setuptools
	zope.annotation
	zope.component[zcml]
	zope.configuration ; extra == 'test'
	zope.configuration ; extra == 'testing'
	zope.datetime
	zope.interface
	zope.lifecycleevent
	zope.location
	zope.publisher ; extra == 'test'
	zope.schema
	zope.security[zcml] (>=3.8)
	zope.testing (>=3.8) ; extra == 'test'
	zope.testing (>=3.8) ; extra == 'testing'
	zope.testing ; extra == 'docs'
	zope.testrunner ; extra == 'test'
	zope.testrunner ; extra == 'testing'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/persistent[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	docs? ( dev-python/repoze-sphinx-autointerface[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	dev-python/zope-annotation[${PYTHON_USEDEP}]
	dev-python/zope-component[zcml,${PYTHON_USEDEP}]
	dev-python/zope-datetime[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	dev-python/zope-lifecycleevent[${PYTHON_USEDEP}]
	dev-python/zope-location[${PYTHON_USEDEP}]
	dev-python/zope-schema[${PYTHON_USEDEP}]
	>=dev-python/zope-security-3.8[zcml,${PYTHON_USEDEP}]
	docs? ( dev-python/zope-testing[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/btrees[${PYTHON_USEDEP}]
		dev-python/zope-configuration[${PYTHON_USEDEP}]
		dev-python/zope-publisher[${PYTHON_USEDEP}]
		>=dev-python/zope-testing-3.8[${PYTHON_USEDEP}]
		dev-python/zope-testrunner[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
