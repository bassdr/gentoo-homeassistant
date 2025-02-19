# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.8.0)"
S="${WORKDIR}/$(pypi_normalize_name ${PN})-0.8.0"

DESCRIPTION="Bose Soundtouch Python library"
HOMEPAGE="
  https://pypi.org/project/libsoundtouch/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	enum-compat (>=0.0.2)
	requests (<3,>=2)
	websocket-client (>=0.40.0)
	zeroconf (>=0.19.1)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/enum-compat-0.0.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2[${PYTHON_USEDEP}] <dev-python/requests-3[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.40.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.19.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/enum-compat-0.0.2[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.40.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.19.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests unittest
