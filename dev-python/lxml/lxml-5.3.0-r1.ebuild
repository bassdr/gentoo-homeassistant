# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature toolchain-funcs

DESCRIPTION="Powerful and Pythonic XML processing library combining libxml2/libxslt with the ElementTree API."
HOMEPAGE="
  https://pypi.org/project/lxml/
  Source, https://github.com/lxml/lxml
"
SRC_URI="
	https://github.com/lxml/lxml/archive/${P}.tar.gz
		-> ${P}.gh.tar.gz
"
S=${WORKDIR}/lxml-${P}

LICENSE="BSD ElementTree GPL-2 PSF-2"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="cssselect html-clean html5 htmlsoup source"
IUSE="${GENERATED_IUSE} doc examples +threads test"
RESTRICT="!test? ( test )"

# Note: lib{xml2,xslt} are used as C libraries, not Python modules.
DEPEND="
	>=dev-libs/libxml2-2.10.3
	>=dev-libs/libxslt-1.1.38
"
REQUIRES_DIST="
	BeautifulSoup4; extra == 'htmlsoup'
	Cython>=3.0.11; extra == 'source'
	cssselect>=0.7; extra == 'cssselect'
	html5lib; extra == 'html5'
	lxml-html-clean; extra == 'html-clean'
"
GENERATED_RDEPEND="${RDEPEND}
	htmlsoup? ( dev-python/beautifulsoup4[${PYTHON_USEDEP}] )
	cssselect? ( >=dev-python/cssselect-0.7[${PYTHON_USEDEP}] )
	source? ( >=dev-python/cython-3.0.11[${PYTHON_USEDEP}] )
	html5? ( dev-python/html5lib[${PYTHON_USEDEP}] )
	html-clean? ( dev-python/lxml-html-clean[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	${DEPEND}
"
BDEPEND="
	virtual/pkgconfig
	>=dev-python/cython-3.0.10[${PYTHON_USEDEP}]
	doc? (
		$(python_gen_any_dep '
			dev-python/docutils[${PYTHON_USEDEP}]
			dev-python/pygments[${PYTHON_USEDEP}]
			dev-python/sphinx[${PYTHON_USEDEP}]
			dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}]
		')
	)
	test? (
		dev-python/cssselect[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	"${FILESDIR}/${PN}-5.3.0-pypy.patch"
)

python_check_deps() {
	use doc || return 0
	python_has_version -b "dev-python/docutils[${PYTHON_USEDEP}]" &&
	python_has_version -b "dev-python/pygments[${PYTHON_USEDEP}]" &&
	python_has_version -b "dev-python/sphinx[${PYTHON_USEDEP}]" &&
	python_has_version -b "dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}]"
}

python_prepare_all() {
	# don't use some random SDK on Darwin
	sed -i -e '/_ldflags =/s/=.*isysroot.*darwin.*None/= None/' \
		setupinfo.py || die

	distutils-r1_python_prepare_all
}

python_compile() {
	local DISTUTILS_ARGS=(
		# by default it adds -w to CFLAGS
		--warnings
	)
	tc-export PKG_CONFIG
	distutils-r1_python_compile
}

python_compile_all() {
	use doc && emake html
}

python_test() {
	local dir=${BUILD_DIR}/test$(python_get_sitedir)/lxml
	local -x PATH=${BUILD_DIR}/test/usr/bin:${PATH}

	cp -al "${BUILD_DIR}"/{install,test} || die
	cp -al src/lxml/tests "${dir}/" || die
	cp -al src/lxml/html/tests "${dir}/html/" || die
	mkdir "${dir}"/../../doc || die
	# this one needs to be copied, because upstream uses doc/../../../doc
	cp -r "${S}"/doc "${dir}"/../../ || die
	ln -s "${S}"/doc "${dir}"/../../../../ || die

	"${EPYTHON}" test.py --no-src -vv --all-levels -p ||
		die "Tests fail on ${EPYTHON}"
}

python_install_all() {
	if use doc; then
		local DOCS=( README.rst *.txt doc/*.txt )
		local HTML_DOCS=( doc/html/. )
	fi
	if use examples; then
		dodoc -r samples
	fi

	distutils-r1_python_install_all
}

pkg_postinst() {
	optfeature "Support for BeautifulSoup as a parser backend" dev-python/beautifulsoup4
	optfeature "Translates CSS selectors to XPath 1.0 expressions" dev-python/cssselect
	optfeature "Support for lxml.html.clean sanitizer" dev-python/lxml-html-clean
}
