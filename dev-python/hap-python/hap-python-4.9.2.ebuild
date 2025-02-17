# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="HomeKit Accessory Protocol implementation in python"
HOMEPAGE="
  https://pypi.org/project/hap-python/
  Bug Reports, https://github.com/ikalchev/HAP-python/issues
  Documentation, http://hap-python.readthedocs.io/en/latest/
  Source, https://github.com/ikalchev/HAP-python/tree/master
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="qrcode"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	async-timeout
	base36; extra == 'qrcode'
	chacha20poly1305-reuseable
	cryptography
	h11
	orjson>=3.7.2
	pyqrcode; extra == 'qrcode'
	zeroconf>=0.36.2
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/async-timeout[${PYTHON_USEDEP}]
	qrcode? ( dev-python/base36[${PYTHON_USEDEP}] )
	dev-python/chacha20poly1305-reuseable[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/h11[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.7.2[${PYTHON_USEDEP}]
	qrcode? ( dev-python/pyqrcode[${PYTHON_USEDEP}] )
	>=dev-python/zeroconf-0.36.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_10)
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/chacha20poly1305-reuseable[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.7.2[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.36.2[${PYTHON_USEDEP}]
	dev-python/h11[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
