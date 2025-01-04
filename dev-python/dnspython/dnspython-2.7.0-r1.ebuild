# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1

DESCRIPTION="DNS toolkit"
HOMEPAGE="
  https://pypi.org/project/dnspython/
  homepage, https://www.dnspython.org
  repository, https://github.com/rthalley/dnspython.git
  documentation, https://dnspython.readthedocs.io/en/stable/
  issues, https://github.com/rthalley/dnspython/issues
"
SRC_URI="
	https://github.com/rthalley/dnspython/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="dnssec examples"

RDEPEND="
	dnssec? (
		>=dev-python/cryptography-41[${PYTHON_USEDEP}]
	)
	>=dev-python/idna-2.1[${PYTHON_USEDEP}]
"
# note: skipping DoH test deps because they require Internet anyway
BDEPEND="
	test? (
		>=dev-python/cryptography-41[${PYTHON_USEDEP}]
		>=dev-python/quart-trio-0.11.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x NO_INTERNET=1
	epytest
}

python_install_all() {
	distutils-r1_python_install_all
	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
}
