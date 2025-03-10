# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs test test-bbb"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
PYPI_PN="zope.testbrowser"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zope-testbrowser/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	BeautifulSoup4
	SoupSieve>=1.9.0
	Sphinx; extra == 'docs'
	WSGIProxy2
	WebTest>=2.0.30
	legacy-cgi; python_version > '3.12'
	mock; extra == 'test'
	pytz
	repoze.sphinx.autointerface; extra == 'docs'
	setuptools
	sphinx-rtd-theme; extra == 'docs'
	zope.app.wsgi; extra == 'docs'
	zope.cachedescriptors
	zope.interface
	zope.schema
	zope.testbrowser[test]; extra == 'test-bbb'
	zope.testing; extra == 'test'
	zope.testrunner; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/legacy-cgi[${PYTHON_USEDEP}]' python3_13{,t})
	dev-python/pytz[${PYTHON_USEDEP}]
	docs? ( dev-python/repoze-sphinx-autointerface[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/soupsieve-1.9.0[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	>=dev-python/webtest-2.0.30[${PYTHON_USEDEP}]
	dev-python/wsgiproxy2[${PYTHON_USEDEP}]
	docs? ( dev-python/zope-app-wsgi[${PYTHON_USEDEP}] )
	dev-python/zope-cachedescriptors[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	dev-python/zope-schema[${PYTHON_USEDEP}]
	test-bbb? ( dev-python/zope-testbrowser[test,${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/zope-testing[${PYTHON_USEDEP}]
		dev-python/zope-testrunner[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
