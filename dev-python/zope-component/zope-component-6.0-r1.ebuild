# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
PYPI_PN="zope.component"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zope-component/"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs mintests persistentregistry security test zcml"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	Sphinx ; extra == 'docs'
	ZODB ; extra == 'docs'
	persistent ; extra == 'persistentregistry'
	persistent ; extra == 'test'
	repoze.sphinx.autointerface ; extra == 'docs'
	setuptools
	zope.configuration ; extra == 'mintests'
	zope.configuration ; extra == 'test'
	zope.configuration ; extra == 'zcml'
	zope.event
	zope.hookable (>=4.2.0)
	zope.i18nmessageid ; extra == 'mintests'
	zope.i18nmessageid ; extra == 'test'
	zope.i18nmessageid ; extra == 'zcml'
	zope.interface (>=5.3)
	zope.location ; extra == 'security'
	zope.location ; extra == 'test'
	zope.proxy ; extra == 'security'
	zope.proxy ; extra == 'test'
	zope.security ; extra == 'security'
	zope.security ; extra == 'test'
	zope.testing ; extra == 'mintests'
	zope.testing ; extra == 'test'
	zope.testrunner ; extra == 'mintests'
	zope.testrunner ; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
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
RDEPEND="${GENERATED_RDEPEND}
	dev-python/zope-event[${PYTHON_USEDEP}]
	>=dev-python/zope-hookable-4.2.0[${PYTHON_USEDEP}]
	>=dev-python/zope-interface-5.3.0[${PYTHON_USEDEP}]
	!dev-python/namespace-zope
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/persistent[${PYTHON_USEDEP}]
		dev-python/zope-configuration[${PYTHON_USEDEP}]
		dev-python/zope-i18nmessageid[${PYTHON_USEDEP}]
		dev-python/zope-location[${PYTHON_USEDEP}]
		dev-python/zope-proxy[${PYTHON_USEDEP}]
		dev-python/zope-security[${PYTHON_USEDEP}]
		dev-python/zope-testing[${PYTHON_USEDEP}]
		dev-python/zope-testrunner[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/zope-configuration[${PYTHON_USEDEP}]
		dev-python/zope-i18nmessageid[${PYTHON_USEDEP}]
		dev-python/zope-testing[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest

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
