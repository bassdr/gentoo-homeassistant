# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs test untrusted"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
PYPI_PN="zope.pagetemplate"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zope-pagetemplate/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Sphinx ; extra == 'docs'
	repoze.sphinx.autointerface ; extra == 'docs'
	setuptools
	zope.component
	zope.i18n >=4.0.1
	zope.i18nmessageid
	zope.interface
	zope.proxy ; extra == 'test'
	zope.security ; extra == 'test'
	zope.tal >=4.2.0
	zope.tales
	zope.testing ; extra == 'test'
	zope.testrunner ; extra == 'test'
	zope.traversing
	zope.untrustedpython >=5.0.dev0 ; extra == 'test'
	zope.untrustedpython >=5.0.dev0 ; extra == 'untrusted'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/repoze-sphinx-autointerface[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	dev-python/zope-component[${PYTHON_USEDEP}]
	>=dev-python/zope-i18n-4.0.1[${PYTHON_USEDEP}]
	dev-python/zope-i18nmessageid[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	>=dev-python/zope-tal-4.2.0[${PYTHON_USEDEP}]
	dev-python/zope-tales[${PYTHON_USEDEP}]
	dev-python/zope-traversing[${PYTHON_USEDEP}]
	untrusted? ( >=dev-python/zope-untrustedpython-5.0_pre0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/zope-proxy[${PYTHON_USEDEP}]
		dev-python/zope-security[${PYTHON_USEDEP}]
		dev-python/zope-testing[${PYTHON_USEDEP}]
		dev-python/zope-testrunner[${PYTHON_USEDEP}]
		>=dev-python/zope-untrustedpython-5.0_pre0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
