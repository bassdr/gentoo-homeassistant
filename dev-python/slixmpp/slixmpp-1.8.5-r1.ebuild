# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1

DESCRIPTION="Slixmpp is an elegant Python library for XMPP (aka Jabber)."
HOMEPAGE="
  https://pypi.org/project/slixmpp/
"
LICENSE="MIT"
SLOT="0"

if [[ "${PV}" == "9999" ]]; then
	EGIT_REPO_URI="https://codeberg.org/poezio/slixmpp.git"
	inherit git-r3
else
	inherit pypi
KEYWORDS="amd64 arm64"
fi

GENERATED_DEPEND="
	dev-python/aiodns[${PYTHON_USEDEP}]
	dev-python/pyasn1-modules[${PYTHON_USEDEP}]
	dev-python/pyasn1[${PYTHON_USEDEP}]
"
DEPEND="
	net-dns/libidn:=
"
RDEPEND="${GENERATED_DEPEND} 
	dev-python/aiodns[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	dev-python/pyasn1-modules[${PYTHON_USEDEP}]
	dev-python/pyasn1[${PYTHON_USEDEP}]
	${DEPEND}
	$(python_gen_cond_dep '
		>=dev-lang/python-3.12.1_p1:3.12
	' python3_12)
"
BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest

python_test() {
	rm -rf slixmpp || die
	eunittest -s tests
}
