# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="zope.component"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zope.component/"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs mintests persistentregistry security zcml"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	persistentregistry? ( dev-python/persistent[${PYTHON_USEDEP}] )
	docs? ( dev-python/repoze-sphinx-autointerface[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/zodb[${PYTHON_USEDEP}] )
	mintests? ( dev-python/zope-configuration[${PYTHON_USEDEP}] )
	zcml? ( dev-python/zope-configuration[${PYTHON_USEDEP}] )
	dev-python/zope-event[${PYTHON_USEDEP}]
	>=dev-python/zope-hookable-4.2.0[${PYTHON_USEDEP}]
	mintests? ( dev-python/zope-i18nmessageid[${PYTHON_USEDEP}] )
	zcml? ( dev-python/zope-i18nmessageid[${PYTHON_USEDEP}] )
	>=dev-python/zope-interface-5.3[${PYTHON_USEDEP}]
	security? ( dev-python/zope-location[${PYTHON_USEDEP}] )
	security? ( dev-python/zope-proxy[${PYTHON_USEDEP}] )
	security? ( dev-python/zope-security[${PYTHON_USEDEP}] )
	mintests? ( dev-python/zope-testing[${PYTHON_USEDEP}] )
	mintests? ( dev-python/zope-testrunner[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/zope-event[${PYTHON_USEDEP}]
	>=dev-python/zope-hookable-4.2.0[${PYTHON_USEDEP}]
	>=dev-python/zope-interface-5.3.0[${PYTHON_USEDEP}]
	!dev-python/namespace-zope
"
BDEPEND="
	test? (
		dev-python/zope-configuration[${PYTHON_USEDEP}]
		dev-python/zope-i18nmessageid[${PYTHON_USEDEP}]
		dev-python/zope-testing[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest
BDEPEND+=" test? (
	dev-python/persistent[${PYTHON_USEDEP}]
	dev-python/zope-configuration[${PYTHON_USEDEP}]
	dev-python/zope-i18nmessageid[${PYTHON_USEDEP}]
	dev-python/zope-location[${PYTHON_USEDEP}]
	dev-python/zope-proxy[${PYTHON_USEDEP}]
	dev-python/zope-security[${PYTHON_USEDEP}]
	dev-python/zope-testing[${PYTHON_USEDEP}]
	dev-python/zope-testrunner[${PYTHON_USEDEP}]
)"

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
