# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="RtmAPI"
inherit distutils-r1 pypi

DESCRIPTION="API package for rememberthemilk.com"
HOMEPAGE="
  https://pypi.org/project/rtmapi/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README"

RDEPEND=">=dev-python/httplib2-0.6.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

PATCHES=( "${FILESDIR}/${PN}-0.7.2-2to3.patch" )

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
