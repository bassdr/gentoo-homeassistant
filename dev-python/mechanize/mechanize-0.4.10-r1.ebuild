# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="Stateful, programmatic web browsing"
HOMEPAGE="
  https://pypi.org/project/mechanize/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="
	dev-python/html5lib[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} 
	>=dev-python/html5lib-0.999999999[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		${RDEPEND}
	)
"

python_test() {
	"${EPYTHON}" run_tests.py -v || die
}
