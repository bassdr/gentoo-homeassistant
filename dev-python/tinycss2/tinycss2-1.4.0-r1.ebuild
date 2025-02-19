# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

CSS_TEST_COMMIT_ID=43e65b244133f17eb8a4d4404d5774672b94824f

DESCRIPTION="A tiny CSS parser"
HOMEPAGE="
  https://pypi.org/project/tinycss2/
  Changelog, https://github.com/Kozea/tinycss2/releases
  Code, https://github.com/Kozea/tinycss2/
  Documentation, https://doc.courtbouillon.org/tinycss2/
  Donation, https://opencollective.com/courtbouillon
  Homepage, https://www.courtbouillon.org/tinycss2
  Issues, https://github.com/Kozea/tinycss2/issues
"
SRC_URI+="
	test? (
		https://github.com/CourtBouillon/css-parsing-tests/archive/${CSS_TEST_COMMIT_ID}.tar.gz
			-> css-parsing-tests-${CSS_TEST_COMMIT_ID}.gh.tar.gz
	)
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	pytest; extra == 'test'
	ruff; extra == 'test'
	sphinx; extra == 'doc'
	sphinx_rtd_theme; extra == 'doc'
	webencodings>=0.4
"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	>=dev-python/webencodings-0.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/webencodings-0.4[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_prepare() {
	if use test; then
		mv "${WORKDIR}/css-parsing-tests-${CSS_TEST_COMMIT_ID}"/* \
			tests/css-parsing-tests/ || die
	fi
	distutils-r1_src_prepare
}
