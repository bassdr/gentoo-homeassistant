# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="devolo PLC devices in Python"
HOMEPAGE="
  https://pypi.org/project/devolo-plc-api/
  changelog, https://github.com/2Fake/devolo_plc_api/docs/CHANGELOG.md
  homepage, https://github.com/2Fake/devolo_plc_api
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/ifaddr[${PYTHON_USEDEP}]
	dev-python/zeroconf[${PYTHON_USEDEP}]
	dev-python/segno[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/ifaddr[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.21[${PYTHON_USEDEP}]
	dev-python/protobuf-python[${PYTHON_USEDEP}]
	>=dev-python/segno-1.5.2[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.70.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-httpx[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
