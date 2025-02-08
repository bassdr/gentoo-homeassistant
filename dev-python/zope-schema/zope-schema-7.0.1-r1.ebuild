# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
PYPI_PN="zope.schema"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zope-schema/"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	Sphinx ; extra == 'docs'
	repoze.sphinx.autointerface ; extra == 'docs'
	setuptools
	zope.event
	zope.i18nmessageid ; extra == 'test'
	zope.interface (>=5.0.0)
	zope.testing ; extra == 'test'
	zope.testrunner ; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/repoze-sphinx-autointerface[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	dev-python/zope-event[${PYTHON_USEDEP}]
	>=dev-python/zope-interface-5.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/zope-event[${PYTHON_USEDEP}]
	>=dev-python/zope-interface-5.0.0[${PYTHON_USEDEP}]
	!dev-python/namespace-zope
"
BDEPEND="
	test? (
		dev-python/zope-i18nmessageid[${PYTHON_USEDEP}]
		dev-python/zope-testing[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/zope-i18nmessageid[${PYTHON_USEDEP}]
		dev-python/zope-testing[${PYTHON_USEDEP}]
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
