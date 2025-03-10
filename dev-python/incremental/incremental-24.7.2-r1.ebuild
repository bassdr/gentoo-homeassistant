# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A small library that versions your Python projects."
HOMEPAGE="
  https://pypi.org/project/incremental/
  Homepage, https://github.com/twisted/incremental
  Documentation, https://twisted.org/incremental/docs/
  Issues, https://github.com/twisted/incremental/issues
  Changelog, https://github.com/twisted/incremental/blob/trunk/NEWS.rst
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="scripts"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	click>=6.0; extra == 'scripts'
	setuptools>=61.0
	tomli; python_version < '3.11'
"
GENERATED_RDEPEND="${RDEPEND}
	scripts? ( >=dev-python/click-6.0[${PYTHON_USEDEP}] )
	>=dev-python/setuptools-61.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/setuptools-61.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/tomli[${PYTHON_USEDEP}]
	' 3.10)
"
# note: most of test deps are for examples that we can't run without
# Internet
BDEPEND="
	${RDEPEND}
	test? (
		dev-python/twisted[${PYTHON_USEDEP}]
	)
"
RDEPEND+="
	>=dev-python/click-6.0[${PYTHON_USEDEP}]
"

python_test() {
	"${EPYTHON}" -m twisted.trial incremental ||
		die "Tests failed on ${EPYTHON}"
}
