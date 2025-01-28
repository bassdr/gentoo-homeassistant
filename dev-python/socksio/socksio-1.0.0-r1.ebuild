# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Sans-I/O implementation of SOCKS4, SOCKS4A, and SOCKS5."
HOMEPAGE="
  https://pypi.org/project/socksio/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest

src_prepare() {
	# remove coverage args for tests
	rm pytest.ini || die

	distutils-r1_src_prepare
}
