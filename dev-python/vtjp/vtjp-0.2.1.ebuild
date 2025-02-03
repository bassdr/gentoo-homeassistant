# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Västtrafik API."
HOMEPAGE="
  https://pypi.org/project/vtjp/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

#DOCS="README.md"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.7.5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/requests-2.9.1[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.7.5[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
