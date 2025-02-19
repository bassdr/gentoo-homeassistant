# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="An XML Schema validator and decoder"
HOMEPAGE="
  https://pypi.org/project/xmlschema/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="codegen docs test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	Sphinx; extra == 'dev'
	Sphinx; extra == 'docs'
	coverage; extra == 'dev'
	elementpath<5.0.0,>=4.4.0
	elementpath<5.0.0,>=4.4.0; extra == 'codegen'
	elementpath<5.0.0,>=4.4.0; extra == 'dev'
	elementpath<5.0.0,>=4.4.0; extra == 'docs'
	flake8; extra == 'dev'
	jinja2; extra == 'codegen'
	jinja2; extra == 'dev'
	jinja2; extra == 'docs'
	lxml-stubs; extra == 'dev'
	lxml; extra == 'dev'
	memory-profiler; extra == 'dev'
	mypy; extra == 'dev'
	sphinx-rtd-theme; extra == 'dev'
	sphinx-rtd-theme; extra == 'docs'
	tox; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/elementpath-4.4.0[${PYTHON_USEDEP}] <dev-python/elementpath-5.0.0[${PYTHON_USEDEP}]
	codegen? ( >=dev-python/elementpath-4.4.0[${PYTHON_USEDEP}] <dev-python/elementpath-5.0.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/elementpath-4.4.0[${PYTHON_USEDEP}] <dev-python/elementpath-5.0.0[${PYTHON_USEDEP}] )
	codegen? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	docs? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/elementpath-5[${PYTHON_USEDEP}]
	>=dev-python/elementpath-4.4.0[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		>=dev-python/elementpath-4.4.0[${PYTHON_USEDEP}] <dev-python/elementpath-5.0.0[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/lxml-stubs[${PYTHON_USEDEP}]
		dev-python/memory-profiler[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		${RDEPEND}
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/lxml[${PYTHON_USEDEP}]
	)
"

python_test() {
	"${EPYTHON}" tests/test_all.py -v || die "Tests fail with ${EPYTHON}"
}
