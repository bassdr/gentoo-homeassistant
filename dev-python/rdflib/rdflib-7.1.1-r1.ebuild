# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="sqlite?,threads(+)"

inherit distutils-r1 pypi

DESCRIPTION="RDFLib is a Python library for working with RDF, a simple yet powerful language for representing information."
HOMEPAGE="
  https://pypi.org/project/rdflib/
  Documentation, https://rdflib.readthedocs.org/
  Repository, https://github.com/RDFLib/rdflib
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="berkeleydb html lxml networkx orjson"
IUSE="${GENERATED_IUSE} examples sqlite"

GENERATED_DEPEND="${RDEPEND}
	berkeleydb? ( <dev-python/berkeleydb-19.0.0[${PYTHON_USEDEP}] )
	html? ( <dev-python/html5rdf-2[${PYTHON_USEDEP}] )
	lxml? ( <dev-python/lxml-6.0[${PYTHON_USEDEP}] )
	networkx? ( <dev-python/networkx-4[${PYTHON_USEDEP}] )
	orjson? ( <dev-python/orjson-4[${PYTHON_USEDEP}] )
	<dev-python/pyparsing-4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	<dev-python/isodate-1[${PYTHON_USEDEP}]
	>=dev-python/isodate-0.7.2[${PYTHON_USEDEP}]
	dev-python/html5lib[${PYTHON_USEDEP}]
	<dev-python/pyparsing-4[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-2.1.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/requests[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	# https://src.fedoraproject.org/fork/salimma/rpms/python-rdflib/blob/d2fbf492897262350bd569f1566b97a54e092cd9/f/rdflib-py3_13-fix-pickler.diff
	"${FILESDIR}/${PN}-7.1.0-py3_13-fix-pickler.diff"
)

distutils_enable_tests pytest

python_prepare_all() {
	distutils-r1_python_prepare_all

	# doctests require internet
	sed -i -e '/doctest-modules/d' pyproject.toml || die

	# we disable pytest-cov
	sed -i -e 's@, no_cover: None@@' test/test_misc/test_plugins.py || die

	# allow regular html5lib, html5rdf is a fork with minimal changes:
	# removing six dep (which is kinda good) and bundling webencodings
	# (which is horrible)
	find -name '*.py' -exec sed -i -e 's:html5rdf:html5lib:g' {} + || die
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -m "not webtest"
}

python_install_all() {
	distutils-r1_python_install_all

	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
}
