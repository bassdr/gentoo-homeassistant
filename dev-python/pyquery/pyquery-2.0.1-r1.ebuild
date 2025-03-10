# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

DESCRIPTION="A jquery-like library for python"
HOMEPAGE="
  https://pypi.org/project/pyquery/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	cssselect>=1.2.0
	lxml>=2.1
	pytest-cov; extra == 'test'
	pytest; extra == 'test'
	requests; extra == 'test'
	webob; extra == 'test'
	webtest; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cssselect-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/lxml-2.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/lxml-2.1[${PYTHON_USEDEP}]
	>=dev-python/cssselect-1.2.0[${PYTHON_USEDEP}]
"
DEPEND="
	test? (
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/webtest[${PYTHON_USEDEP}]
		dev-python/webob[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/webob[${PYTHON_USEDEP}]
		dev-python/webtest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local EPYTEST_DESELECT=(
		# needs network
		tests/test_pyquery.py::TestWebScrappingEncoding::test_get
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}

pkg_postinst() {
	optfeature "Support for BeautifulSoup3 as a parser backend" dev-python/beautifulsoup4
}
