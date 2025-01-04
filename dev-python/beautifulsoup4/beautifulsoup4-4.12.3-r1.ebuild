# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_PN="BeautifulSoup4"
inherit distutils-r1 pypi

DESCRIPTION="Screen-scraping library"
HOMEPAGE="
  https://pypi.org/project/BeautifulSoup4/
  Download, https://www.crummy.com/software/BeautifulSoup/bs4/download/
  Homepage, https://www.crummy.com/software/BeautifulSoup/bs4/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/soupsieve[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/soupsieve-1.3[${PYTHON_USEDEP}]
	dev-python/html5lib[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
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
