# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Python bindings to the Tree-sitter parsing library"
HOMEPAGE="
  https://pypi.org/project/tree-sitter/
  Homepage, https://tree-sitter.github.io/tree-sitter/
  Source, https://github.com/tree-sitter/py-tree-sitter
  Documentation, https://tree-sitter.github.io/py-tree-sitter/
"
SRC_URI="
	https://github.com/tree-sitter/py-tree-sitter/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"
S=${WORKDIR}/py-${P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

# setuptools is needed for distutils import
DEPEND=">=dev-libs/tree-sitter-0.24.0:="
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	sphinx-book-theme; extra == 'docs'
	sphinx~=7.3; extra == 'docs'
	tree-sitter-html>=0.23.0; extra == 'tests'
	tree-sitter-javascript>=0.23.0; extra == 'tests'
	tree-sitter-json>=0.23.0; extra == 'tests'
	tree-sitter-python>=0.23.0; extra == 'tests'
	tree-sitter-rust>=0.23.0; extra == 'tests'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( >=dev-python/sphinx-7.3[${PYTHON_USEDEP}] =dev-python/sphinx-7*[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND} ${DEPEND}
	$(python_gen_cond_dep '
		dev-python/setuptools[${PYTHON_USEDEP}]
	' 3.12)
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/tree-sitter-html-0.23.0[${PYTHON_USEDEP}]
		>=dev-python/tree-sitter-javascript-0.23.0[${PYTHON_USEDEP}]
		>=dev-python/tree-sitter-json-0.23.0[${PYTHON_USEDEP}]
		>=dev-python/tree-sitter-python-0.23.0[${PYTHON_USEDEP}]
		>=dev-python/tree-sitter-rust-0.23.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		>=dev-libs/tree-sitter-html-0.23.0[python,${PYTHON_USEDEP}]
		>=dev-libs/tree-sitter-javascript-0.23.0[python,${PYTHON_USEDEP}]
		>=dev-libs/tree-sitter-json-0.23.0[python,${PYTHON_USEDEP}]
		>=dev-libs/tree-sitter-python-0.23.0[python,${PYTHON_USEDEP}]
		>=dev-libs/tree-sitter-rust-0.23.0[python,${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/${PN}-0.22.2-unbundle.patch
)

src_unpack() {
	default
	rmdir "${S}/tree_sitter/core" || die
}

src_test() {
	rm -r tree_sitter || die
	distutils-r1_src_test
}
