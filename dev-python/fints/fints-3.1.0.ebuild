# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Pure-python FinTS 3.0 (formerly known as HBCI) implementation"
HOMEPAGE="
  https://pypi.org/project/fints/
"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	bleach
	mt-940
	requests
	sepaxml (~=2.1)
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/bleach[${PYTHON_USEDEP}]
	dev-python/mt_940[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/sepaxml-2.1[${PYTHON_USEDEP}] =dev-python/sepaxml-2*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/bleach[${PYTHON_USEDEP}]
	dev-python/mt_940[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/sepaxml-2.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
