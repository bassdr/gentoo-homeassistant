# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Bose Soundtouch Python library"
HOMEPAGE="
  https://pypi.org/project/libsoundtouch/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/enum-compat-0.0.2[${PYTHON_USEDEP}]
	dev-python/enum-compat[${PYTHON_USEDEP}]
	<dev-python/requests-3[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.40.0[${PYTHON_USEDEP}]
	dev-python/websocket-client[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.19.1[${PYTHON_USEDEP}]
	dev-python/zeroconf[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
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
