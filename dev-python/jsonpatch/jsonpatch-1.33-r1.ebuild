# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=python-json-patch-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jsonpatch/"
SRC_URI="
	https://github.com/stefankoegl/python-json-patch/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	jsonpointer (>=1.9)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/jsonpointer-1.9[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/jsonpointer-1.9[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		${RDEPEND}
	)
"

src_prepare() {
	distutils-r1_src_prepare

	# https://github.com/stefankoegl/python-json-patch/pull/159
	sed -e 's/unittest.makeSuite/unittest.defaultTestLoader.loadTestsFromTestCase/' \
		-i ext_tests.py tests.py
}

python_test() {
	"${EPYTHON}" tests.py || die "Tests of tests.py fail with ${EPYTHON}"
	"${EPYTHON}" ext_tests.py || die "Tests of ext_tests.py fail with ${EPYTHON}"
}
