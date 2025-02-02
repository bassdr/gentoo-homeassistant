# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=python-xmlsec-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/xmlsec/"
SRC_URI="
	https://github.com/xmlsec/python-xmlsec/archive/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_DEPEND="${RDEPEND}
	>=dev-python/lxml-3.8[${PYTHON_USEDEP}]
"
DEPEND="
	dev-libs/xmlsec:=[openssl]
"
RDEPEND="${GENERATED_DEPEND}
	${DEPEND}
	dev-python/lxml[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/pkgconfig[${PYTHON_USEDEP}]
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	"${FILESDIR}"/${P}-c99.patch
)

EPYTEST_DESELECT=(
	# Fragile based on black version?
	tests/test_type_stubs.py::test_xmlsec_constants_stub
)

distutils_enable_tests pytest

src_configure() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

	export PYXMLSEC_OPTIMIZE_SIZE=
	if use debug; then
		# we don't want to use PYXMLSEC_ENABLE_DEBUG envvar,
		# as it forces -O0
		export CPPFLAGS="${CPPFLAGS} -DPYXMLSEC_ENABLE_DEBUG=1"
	fi
}
