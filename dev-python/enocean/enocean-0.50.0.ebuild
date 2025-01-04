# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="EnOcean serial protocol implementation"
HOMEPAGE="
  https://pypi.org/project/enocean/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="
	dev-python/enum-compat[${PYTHON_USEDEP}]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/pyserial-3.0[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.3.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest