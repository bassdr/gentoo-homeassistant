# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
PYPI_PN="zope.event"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zope-event/"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	Sphinx ; extra == 'docs'
	setuptools
	zope.testrunner ; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	!dev-python/namespace-zope
"

distutils_enable_tests unittest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/zope-testrunner[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_prepare() {
	# strip rdep specific to namespaces
	sed -i -e "/'setuptools'/d" setup.py || die
	distutils-r1_src_prepare
}

python_compile() {
	distutils-r1_python_compile
	find "${BUILD_DIR}" -name '*.pth' -delete || die
}

python_test() {
	cd "${BUILD_DIR}/install$(python_get_sitedir)" || die
	distutils_write_namespace zope
	eunittest
}
