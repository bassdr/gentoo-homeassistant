# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
DISTUTILS_USE_PEP517=setuptools
PYPI_PN="pyW800rf32"
inherit distutils-r1 pypi

DESCRIPTION="A library to communicate with the W800rf32 family of devices"
HOMEPAGE="
  https://pypi.org/project/pyW800rf32/
  Homepage, https://github.com/horga83/pyW800rf32
  Bug Tracker, https://github.com/horga83/pyW800rf32/issues
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/pyserial[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
dev-python/pyserial[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
