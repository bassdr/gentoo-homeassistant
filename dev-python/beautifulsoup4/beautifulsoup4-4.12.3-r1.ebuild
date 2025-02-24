# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Screen-scraping library"
HOMEPAGE="
  https://pypi.org/project/beautifulsoup4/
  Download, https://www.crummy.com/software/BeautifulSoup/bs4/download/
  Homepage, https://www.crummy.com/software/BeautifulSoup/bs4/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="cchardet chardet charset-normalizer html5lib lxml"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	cchardet; extra == 'cchardet'
	chardet; extra == 'chardet'
	charset-normalizer; extra == 'charset-normalizer'
	html5lib; extra == 'html5lib'
	lxml; extra == 'lxml'
	soupsieve>1.2
"
GENERATED_RDEPEND="${RDEPEND}
	cchardet? ( dev-python/cchardet[${PYTHON_USEDEP}] )
	chardet? ( dev-python/chardet[${PYTHON_USEDEP}] )
	charset-normalizer? ( dev-python/charset-normalizer[${PYTHON_USEDEP}] )
	html5lib? ( dev-python/html5lib[${PYTHON_USEDEP}] )
	lxml? ( dev-python/lxml[${PYTHON_USEDEP}] )
	>dev-python/soupsieve-1.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	!dev-python/bs4
"
# bs4 prefers cchardet > chardet > charset-normalizer
# however, charset-normalizer causes test failures, so force the other two
# dev-python/chardet[${PYTHON_USEDEP}]
BDEPEND="
	test? (
		|| (
			dev-python/faust-cchardet[${PYTHON_USEDEP}]
			dev-python/chardet[${PYTHON_USEDEP}]
		)
	)
"

distutils_enable_tests pytest
distutils_enable_sphinx doc/source
