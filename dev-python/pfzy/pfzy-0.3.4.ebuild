# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python port of the fzy fuzzy string matching algorithm"
HOMEPAGE="
  https://pypi.org/project/pfzy/
  Documentation, https://pfzy.readthedocs.io/
  Repository, https://github.com/kazhala/pfzy
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	docs? ( >=dev-python/furo-2021.8.17_beta.43[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/myst-parser-0.15.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-4.1.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autobuild-2021.3.14[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-copybutton-0.4.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND} dev-python/furo[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
