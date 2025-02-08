# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinxcontrib-httpdomain/"
SRC_URI="
	https://github.com/sphinx-contrib/httpdomain/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"
S="${WORKDIR}/httpdomain-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Sphinx (>=1.6)
	six
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/six[${PYTHON_USEDEP}]
	>=dev-python/sphinx-1.6[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/sphinx[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/flask[${PYTHON_USEDEP}]
		dev-python/bottle[${PYTHON_USEDEP}]
		dev-python/tornado[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_compile() {
	distutils-r1_python_compile
	find "${BUILD_DIR}" -name '*.pth' -delete || die
}

python_test() {
	distutils_write_namespace sphinxcontrib
	cd "${T}" || die
	epytest "${S}"/test
}
