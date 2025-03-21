# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.0.6.4rc0)"
S="${WORKDIR}/$(pypi_normalize_name ${PN})-0.0.6.4rc0"

DESCRIPTION="Asynchronous API Library to work with Elmax devices"
HOMEPAGE="
  https://pypi.org/project/elmax-api/
  Documentation, https://github.com/albertogeniola/elmax-api
  Source, https://github.com/albertogeniola/elmax-api
  Tracker, https://github.com/albertogeniola/elmax-api
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	httpx>=0.18.0
	pyjwt>=1.7.1
	websockets>=13.0
	yarl>=1.6.3
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/httpx-0.18.0[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-1.7.1[${PYTHON_USEDEP}]
	>=dev-python/websockets-13.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pyjwt-1.7.1[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.18.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.3[${PYTHON_USEDEP}]
	>=dev-python/websockets-11.0.3[${PYTHON_USEDEP}]"

# prevent writing a useless file to /usr
src_prepare() {
	sed "s/data_files=\[('.', \['requirements.txt'\])\],/# data_files=\[('.', \['requirements.txt'\])\],/g" -i setup.py || die
	eapply_user
}

distutils_enable_tests pytest
