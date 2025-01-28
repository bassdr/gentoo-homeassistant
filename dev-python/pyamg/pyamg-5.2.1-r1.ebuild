# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyamg/"
SRC_URI="
	https://github.com/pyamg/pyamg/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.11.0[${PYTHON_USEDEP}]
"
DEPEND="
	dev-python/pybind11[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
"
RDEPEND="
	dev-python/cppheaderparser[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.11.0[${PYTHON_USEDEP}]
"
BDEPEND="
	${DEPEND}
	>=dev-python/setuptools-scm-7.0.0[${PYTHON_USEDEP}]
	test? (
		dev-python/matplotlib[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	cd "${T}" || die
	epytest --pyargs pyamg
}
