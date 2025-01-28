# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

PYPI_PN="jaraco.net"
inherit distutils-r1 pypi

DESCRIPTION="Networking tools by jaraco"
HOMEPAGE="
  https://pypi.org/project/jaraco.net/
  Source, https://github.com/jaraco/jaraco.net
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="doc stats-server test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	dev-python/autocommand[${PYTHON_USEDEP}]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	stats-server? ( dev-python/cherrypy[${PYTHON_USEDEP}] )
	test? ( dev-python/cherrypy[${PYTHON_USEDEP}] )
	test? ( dev-python/fabric[${PYTHON_USEDEP}] )
	dev-python/feedparser[${PYTHON_USEDEP}]
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	dev-python/icmplib[${PYTHON_USEDEP}]
	dev-python/ifconfig-parser[${PYTHON_USEDEP}]
	test? ( dev-python/importlib-resources[${PYTHON_USEDEP}] )
	dev-python/jaraco-collections[${PYTHON_USEDEP}]
	dev-python/jaraco-email[${PYTHON_USEDEP}]
	test? ( dev-python/jaraco-fabric[${PYTHON_USEDEP}] )
	dev-python/jaraco-functools[${PYTHON_USEDEP}]
	dev-python/jaraco-logging[${PYTHON_USEDEP}]
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	dev-python/jaraco-text[${PYTHON_USEDEP}]
	!=dev-python/jsonpickle-3.0.0[${PYTHON_USEDEP}]
	dev-python/jsonpickle[${PYTHON_USEDEP}]
	>=dev-python/keyring-0.6[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}]
	dev-python/mechanize[${PYTHON_USEDEP}]
	dev-python/more-itertools[${PYTHON_USEDEP}]
	>=dev-python/path-16.6[${PYTHON_USEDEP}]
	dev-python/path[${PYTHON_USEDEP}]
	dev-python/pathvalidate[${PYTHON_USEDEP}]
	test? ( dev-python/pyparsing[${PYTHON_USEDEP}] )
	test? ( !=dev-python/pytest-8.1*[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-mypy[${PYTHON_USEDEP}] )
	>=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pywin32[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	test? ( dev-python/requests-mock[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
	stats-server? ( dev-python/svg-charts[${PYTHON_USEDEP}] )
	test? ( dev-python/types-python-dateutil[${PYTHON_USEDEP}] )
	test? ( dev-python/types-requests[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/more-itertools[${PYTHON_USEDEP}]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/mechanize[${PYTHON_USEDEP}]
	>=dev-python/keyring-0.6[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/feedparser[${PYTHON_USEDEP}]
	dev-python/jaraco-text[${PYTHON_USEDEP}]
	dev-python/jaraco-logging[${PYTHON_USEDEP}]
	dev-python/jaraco-email[${PYTHON_USEDEP}]
	dev-python/jaraco-functools[${PYTHON_USEDEP}]
	dev-python/jaraco-collections[${PYTHON_USEDEP}]
	>=dev-python/path-16.6[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pathvalidate[${PYTHON_USEDEP}]
	dev-python/jsonpickle[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_install() {
        distutils-r1_python_install
        # remove tests folder in sitedir
        # https://bugs.gentoo.org/834522
        rm -r "${D}$(python_get_sitedir)"/tests || die
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
