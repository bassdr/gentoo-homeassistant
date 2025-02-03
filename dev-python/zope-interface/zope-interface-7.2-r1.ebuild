# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
PYPI_PN="zope.interface"
inherit distutils-r1 pypi

DESCRIPTION="Interfaces for Python"
HOMEPAGE="
  https://pypi.org/project/zope-interface/
"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} +native-extensions"

BDEPEND="
	test? (
		dev-python/zope-event[${PYTHON_USEDEP}]
		dev-python/zope-testing[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[toml,${PYTHON_USEDEP}]
		dev-python/zope-event[${PYTHON_USEDEP}]
		dev-python/zope-testing[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_prepare() {
	distutils-r1_src_prepare

	# strip rdep specific to namespaces
	sed -i -e "/'setuptools'/d" setup.py || die
	# force failure if extension build fails
	sed -i -e "/'build_ext':/d" setup.py || die
	if ! use native-extensions; then
		sed -i -e '/ext_modules=/d' setup.py || die
	fi
}

python_compile() {
	distutils-r1_python_compile
	find "${BUILD_DIR}" -name '*.pth' -delete || die
}

python_test() {
	local -x PURE_PYTHON=0
	if ! use native-extensions || [[ ${EPYTHON} == pypy3 ]]; then
		PURE_PYTHON=1
	fi

	cd "${BUILD_DIR}/install$(python_get_sitedir)" || die
	distutils_write_namespace zope
	eunittest
}
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
