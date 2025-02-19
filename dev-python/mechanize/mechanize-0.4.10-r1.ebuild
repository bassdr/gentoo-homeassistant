# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Stateful, programmatic web browsing"
HOMEPAGE="
  https://pypi.org/project/mechanize/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="binarytest fast test"
IUSE="${GENERATED_IUSE}"

REQUIRES_DIST="
	html5-parser; extra == 'binarytest'
	html5-parser>=0.4.4; extra == 'fast'
	html5lib; extra == 'test'
	html5lib>=0.999999999
	lxml; extra == 'binarytest'
	service-identity; extra == 'test'
	six; extra == 'test'
	twisted; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	binarytest? ( dev-python/html5-parser[${PYTHON_USEDEP}] )
	fast? ( >=dev-python/html5-parser-0.4.4[${PYTHON_USEDEP}] )
	>=dev-python/html5lib-0.999999999[${PYTHON_USEDEP}]
	binarytest? ( dev-python/lxml[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/html5lib-0.999999999[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/html5lib[${PYTHON_USEDEP}]
		dev-python/service-identity[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
		dev-python/twisted[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	"${EPYTHON}" run_tests.py -v || die
}
