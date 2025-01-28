# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# See https://github.com/secdev/scapy/pull/3958#discussion_r1161302244 on next
# bump (>2.5.0)!

PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 readme.gentoo-r1

DESCRIPTION="Scapy: interactive packet manipulation tool"
HOMEPAGE="
  https://pypi.org/project/scapy/
  Homepage, https://scapy.net
  Download, https://github.com/secdev/scapy/tarball/master
  Documentation, https://scapy.readthedocs.io
  Source Code, https://github.com/secdev/scapy
  Changelog, https://github.com/secdev/scapy/releases
"
SRC_URI="https://github.com/secdev/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="all cli doc"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="
	all? ( >=dev-python/cryptography-2.0[${PYTHON_USEDEP}] )
	all? ( dev-python/ipython[${PYTHON_USEDEP}] )
	cli? ( dev-python/ipython[${PYTHON_USEDEP}] )
	all? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	all? ( dev-python/pyx[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-7.0.0[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-rtd-theme-1.3.0[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/tox-3.0.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/zstandard[${PYTHON_USEDEP}]
	)
"

DOC_CONTENTS="
Scapy has optional support for the following packages:

	dev-python/cryptography
	dev-python/ipython
	dev-python/matplotlib
	dev-python/pyx
	media-gfx/graphviz
	net-analyzer/tcpdump
	net-analyzer/tcpreplay
	net-libs/libpcap
	virtual/imagemagick-tools

	See also ""${EPREFIX}/usr/share/doc/${PF}/installation.rst""
"

PATCHES=(
	"${FILESDIR}"/${PN}-2.5.0-no-install-tests.patch
)

src_prepare() {
	if ! [[ -f ${PN}/VERSION ]]; then
		echo ${PV} > ${PN}/VERSION || die
	else
		die
	fi

	# Drop tests which need network
	rm \
		test/nmap.uts \
		test/p0f.uts \
		test/p0fv2.uts \
		test/regression.uts \
		test/scapy/layers/inet6.uts || die
	# Timed out
	rm test/tftp.uts || die
	# Needs ipython
	rm test/scapy/layers/dhcp.uts || die
	# Import failure?
	rm test/contrib/isotp_native_socket.uts test/contrib/isotpscan.uts || die

	distutils-r1_src_prepare
}

python_test() {
	# https://github.com/secdev/scapy/blob/master/tox.ini
	"${EPYTHON}" -m scapy.tools.UTscapy -c ./test/configs/linux.utsc -N || die
}

src_install() {
	distutils-r1_src_install

	dodoc -r doc/${PN}/*
	DISABLE_AUTOFORMATTING=1 readme.gentoo_create_doc
}
