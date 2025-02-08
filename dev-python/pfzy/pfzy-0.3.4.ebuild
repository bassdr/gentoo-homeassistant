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

REQUIRES_DIST="
	Sphinx (>=4.1.2,<5.0.0); extra == "docs"
	furo (>=2021.8.17-beta.43,<2022.0.0); extra == "docs"
	myst-parser (>=0.15.1,<0.16.0); extra == "docs"
	sphinx-autobuild (>=2021.3.14,<2022.0.0); extra == "docs"
	sphinx-copybutton (>=0.4.0,<0.5.0); extra == "docs"
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( >=dev-python/furo-2021.8.17_beta.43[${PYTHON_USEDEP}] <dev-python/furo-2022.0.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/myst-parser-0.15.1[${PYTHON_USEDEP}] <dev-python/myst-parser-0.16.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-4.1.2[${PYTHON_USEDEP}] <dev-python/sphinx-5.0.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autobuild-2021.3.14[${PYTHON_USEDEP}] <dev-python/sphinx-autobuild-2022.0.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-copybutton-0.4.0[${PYTHON_USEDEP}] <dev-python/sphinx-copybutton-0.5.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND} dev-python/furo[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
