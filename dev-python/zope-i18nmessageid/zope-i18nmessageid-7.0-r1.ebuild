# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYPI_PN="zope.i18nmessageid"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zope.i18nmessageid/"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs test testing"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	test? ( dev-python/coverage[${PYTHON_USEDEP}] )
	testing? ( dev-python/coverage[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	test? ( dev-python/zope-testrunner[${PYTHON_USEDEP}] )
	testing? ( dev-python/zope-testrunner[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	!dev-python/namespace-zope
"

distutils_enable_tests unittest

src_prepare() {
	# strip rdep specific to namespaces
	sed -i -e "s:'setuptools'::" setup.py || die
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
