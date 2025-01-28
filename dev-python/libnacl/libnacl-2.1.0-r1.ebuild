# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/libnacl/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	dev-libs/libsodium
"
BDEPEND="
	${RDEPEND}
"

distutils_enable_tests unittest

python_test() {
	eunittest -p 'test_*.py' tests/ ||
		die "Tests failed with ${EPYTHON}"
}
