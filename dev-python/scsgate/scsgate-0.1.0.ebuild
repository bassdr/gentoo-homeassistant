# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Python module to interact with SCSGate"
HOMEPAGE="
  https://pypi.org/project/scsgate/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]"
DEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest