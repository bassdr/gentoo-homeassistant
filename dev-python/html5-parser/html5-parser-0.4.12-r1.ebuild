# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi toolchain-funcs

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/html5-parser/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="soup"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-libs/libxml2:=
"
REQUIRES_DIST="
	beautifulsoup4; extra == 'soup'
	chardet
	lxml>=3.8.0
"
GENERATED_RDEPEND="${RDEPEND}
	soup? ( dev-python/beautifulsoup4[${PYTHON_USEDEP}] )
	dev-python/chardet[${PYTHON_USEDEP}]
	>=dev-python/lxml-3.8.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	${DEPEND}
	dev-python/chardet[${PYTHON_USEDEP}]
	>=dev-python/lxml-3.8.0[${PYTHON_USEDEP}]
"
BDEPEND="
	virtual/pkgconfig
	test? (
		${RDEPEND}
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	)
"

src_configure() {
	export PKGCONFIG_EXE=$(tc-getPKG_CONFIG)
}

python_test() {
	"${EPYTHON}" run_tests.py || die
}
