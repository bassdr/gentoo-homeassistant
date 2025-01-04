# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="This module performs conversions between Python values and C bit field structs represented as Python byte strings."
HOMEPAGE="
  https://pypi.org/project/bitstruct/
  Documentation, https://bitstruct.readthedocs.io/en/latest/
  Issues, https://github.com/eerimoq/bitstruct/issues
  Source, https://github.com/eerimoq/bitstruct
  Homepage, https://github.com/eerimoq/bitstruct
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
