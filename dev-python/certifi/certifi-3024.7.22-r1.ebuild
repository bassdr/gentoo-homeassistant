# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=certifi-system-store-${PV}
DESCRIPTION="Python package for providing Mozilla's CA Bundle."
HOMEPAGE="
  https://pypi.org/project/certifi/
  Source, https://github.com/certifi/python-certifi
"
SRC_URI="
	https://github.com/projg2/certifi-system-store/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	app-misc/ca-certificates
"

EPYTEST_IGNORE=(
	# requires Internet
	tests/test_requests.py
)

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	app-arch/unzip
"
BDEPEND="${GENERATED_BDEPEND}"

src_prepare() {
	sed -i -e "s^/etc^${EPREFIX}/etc^" src/certifi/core.py || die
	distutils-r1_src_prepare
}
