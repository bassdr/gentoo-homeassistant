# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="An easy safelist-based HTML-sanitizing tool."
HOMEPAGE="
  https://pypi.org/project/bleach/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="css"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	tinycss2<1.5,>=1.1.0; extra == 'css'
	webencodings
"
GENERATED_RDEPEND="${RDEPEND}
	css? ( >=dev-python/tinycss2-1.1.0[${PYTHON_USEDEP}] <dev-python/tinycss2-1.5[${PYTHON_USEDEP}] )
	dev-python/webencodings[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/html5lib-1.0.1-r1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/bleach-6.0.0-py39.patch
)

EPYTEST_DESELECT=(
	# this package is not really maintained anymore
	'tests/test_parse_shim.py::test_urlparse[\t   :foo.com   \n-expected8]'
	'tests/test_parse_shim.py::test_urlparse[ foo.com  -expected9]'
)

src_prepare() {
	# unbundle unpatched broken html5lib
	rm -r bleach/_vendor || die
	sed -i -e 's:bleach\._vendor\.parse:urllib.parse:' \
		bleach/parse_shim.py || die
	sed -i -e 's:bleach\._vendor\.::' \
		bleach/html5lib_shim.py \
		bleach/sanitizer.py \
		tests/test_clean.py || die
	# indirect html5lib deps
	sed -i -e '/webencodings/d' setup.py || die
	rm bleach/six_shim.py || die

	distutils-r1_src_prepare
}
