# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Run a subprocess in a pseudo terminal"
HOMEPAGE="
  https://pypi.org/project/ptyprocess/
"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests unittest

src_prepare() {
	distutils-r1_src_prepare

	# https://github.com/pexpect/ptyprocess/pull/75
	sed -i -e '/makeSuite/d' tests/test_invalid_binary.py || die
}