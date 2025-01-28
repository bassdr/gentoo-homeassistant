# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_PN="PrettyTable"
inherit distutils-r1 pypi

DESCRIPTION="A simple Python library for easily displaying tabular data in a visually appealing ASCII table format"
HOMEPAGE="
  https://pypi.org/project/PrettyTable/
  Changelog, https://github.com/prettytable/prettytable/releases
  Funding, https://tidelift.com/subscription/pkg/pypi-prettytable?utm_source=pypi-prettytable&utm_medium=pypi
  Homepage, https://github.com/prettytable/prettytable
  Source, https://github.com/prettytable/prettytable
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="tests"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	tests? ( dev-python/pytest[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-lazy-fixtures[${PYTHON_USEDEP}] )
	dev-python/wcwidth[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/wcwidth[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		$(python_gen_impl_dep sqlite)
		dev-python/pytest-lazy-fixtures[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	# remove the implicit dep on coverage
	sed -i -e '/coverage/d' pyproject.toml || die
}
