# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="PySwitchmate"
inherit distutils-r1 pypi

DESCRIPTION="A library to communicate with Switchmate"
HOMEPAGE="
  https://pypi.org/project/pyswitchmate/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	bleak
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/bleak[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
dev-python/bleak[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
