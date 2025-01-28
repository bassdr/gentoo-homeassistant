# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Async ModBus python library"
HOMEPAGE="
  https://pypi.org/project/async-modbus/
"
MY_PN=${PN/-/_}
SRC_URI="https://github.com/tiagocoutinho/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S=${WORKDIR}/${MY_PN}-${PV}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="numpy tests"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	>=dev-python/connio-0.2.0[${PYTHON_USEDEP}]
	dev-python/connio[${PYTHON_USEDEP}]
	numpy? ( >=dev-python/numpy-1.1[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pytest-6[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	>=dev-python/umodbus-1.0.4[${PYTHON_USEDEP}]
	dev-python/umodbus[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/connio-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/uModbus-1.0.4[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

src_prepare() {
	sed -i "s/packages = find:/packages = async_modbus/g" -i setup.cfg || die
	eapply_user
}
distutils_enable_tests pytest
