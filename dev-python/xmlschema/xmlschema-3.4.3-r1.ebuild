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
GENERATED_IUSE="codegen dev docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="
	dev? ( dev-python/coverage[${PYTHON_USEDEP}] )
	<dev-python/elementpath-5.0.0[${PYTHON_USEDEP}]
	codegen? ( <dev-python/elementpath-5.0.0[${PYTHON_USEDEP}] )
	dev-python/elementpath[${PYTHON_USEDEP}]
	dev? ( <dev-python/elementpath-5.0.0[${PYTHON_USEDEP}] )
	docs? ( <dev-python/elementpath-5.0.0[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8[${PYTHON_USEDEP}] )
	codegen? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	dev? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	docs? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	dev? ( dev-python/lxml[${PYTHON_USEDEP}] )
	dev? ( dev-python/lxml-stubs[${PYTHON_USEDEP}] )
	dev? ( dev-python/memory-profiler[${PYTHON_USEDEP}] )
	dev? ( dev-python/mypy[${PYTHON_USEDEP}] )
	dev? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	dev? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	dev? ( dev-python/tox[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	<dev-python/elementpath-5[${PYTHON_USEDEP}]
	>=dev-python/elementpath-4.4.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		${RDEPEND}
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/lxml[${PYTHON_USEDEP}]
	)
"

python_test() {
	"${EPYTHON}" tests/test_all.py -v || die "Tests fail with ${EPYTHON}"
}
