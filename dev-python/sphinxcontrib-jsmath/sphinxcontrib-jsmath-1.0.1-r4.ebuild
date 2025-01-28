# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A sphinx extension which renders display math in HTML via JavaScript"
HOMEPAGE="
  https://pypi.org/project/sphinxcontrib-jsmath/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	test? ( dev-python/flake8[${PYTHON_USEDEP}] )
	test? ( dev-python/mypy[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
"
PDEPEND="
	>=dev-python/sphinx-2.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? ( ${PDEPEND} )
"

distutils_enable_tests pytest

src_prepare() {
	# This is already fixed in upstream, remove it on next version bump,
	# see https://github.com/sphinx-doc/sphinxcontrib-jsmath/pull/10
	sed -i 's/.text()/.read_text()/' tests/test_jsmath.py || die
	distutils-r1_src_prepare
}

python_compile() {
	distutils-r1_python_compile
	find "${BUILD_DIR}" -name '*.pth' -delete || die
}

python_test() {
	distutils_write_namespace sphinxcontrib
	cd "${T}" || die
	epytest "${S}"/tests
}
