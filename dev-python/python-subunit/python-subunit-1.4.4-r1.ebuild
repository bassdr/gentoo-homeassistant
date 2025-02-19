# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 multilib-minimal autotools

MY_P=subunit-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/python-subunit/"
SRC_URI="
	https://github.com/testing-cabal/subunit/archive/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="Apache-2.0 BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE} static-libs"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	docutils ; extra == 'docs'
	fixtures ; extra == 'test'
	hypothesis ; extra == 'test'
	iso8601
	testscenarios ; extra == 'test'
	testtools (>=0.9.34)
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/docutils[${PYTHON_USEDEP}] )
	dev-python/iso8601[${PYTHON_USEDEP}]
	>=dev-python/testtools-0.9.34[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/testtools-0.9.34[${PYTHON_USEDEP}]
	dev-python/iso8601[${PYTHON_USEDEP}]
"
DEPEND="
	${RDEPEND}
	>=dev-libs/check-0.9.11[${MULTILIB_USEDEP}]
	>=dev-util/cppunit-1.13.2[${MULTILIB_USEDEP}]
	>=virtual/pkgconfig-0-r1
	test? (
		dev-python/fixtures[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/testscenarios[${PYTHON_USEDEP}]
	)
"

GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/fixtures[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/testscenarios[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

PATCHES=(
	"${FILESDIR}/subunit-1.4.0-werror.patch"
)

src_prepare() {
	mv all_tests.py python/ || die

	distutils-r1_src_prepare
	eautoreconf
	multilib_copy_sources
}

multilib_src_configure() {
	ECONF_SOURCE=${S} \
	econf \
		--enable-shared \
		$(use_enable static-libs static)
}

multilib_src_compile() {
	default
	multilib_is_native_abi && distutils-r1_src_compile
}

python_test() {
	cd python || die
	"${EPYTHON}" -m testtools.run -v all_tests.test_suite ||
		die "Testing failed with ${EPYTHON}"
}

multilib_src_test() {
	multilib_is_native_abi && distutils-r1_src_test
}

multilib_src_install() {
	local targets=(
		install-include_subunitHEADERS
		install-pcdataDATA
		install-libLTLIBRARIES
	)
	emake DESTDIR="${D}" "${targets[@]}"

	multilib_is_native_abi && distutils-r1_src_install
}

multilib_src_install_all() {
	einstalldocs
	find "${D}" -name '*.la' -delete || die
}
