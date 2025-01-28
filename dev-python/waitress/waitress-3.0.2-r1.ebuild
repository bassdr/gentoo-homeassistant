# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/waitress/"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# fails on some systems, https://bugs.gentoo.org/782031
	tests/test_wasyncore.py::DispatcherWithSendTests::test_send
)

src_prepare() {
	sed -i -e 's:--cov::' setup.cfg || die
	distutils-r1_src_prepare
}
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
# extras could not be inserted in this ebuild
