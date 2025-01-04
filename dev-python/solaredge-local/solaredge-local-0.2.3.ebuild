# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="API wrapper to communicate locally with SolarEdge Inverters"
HOMEPAGE="
  https://pypi.org/project/solaredge-local/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="
	dev-python/uplink-protobuf[${PYTHON_USEDEP}]
	dev-python/uplink[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/uplink-0.9.7[${PYTHON_USEDEP}]
	>=dev-python/uplink-protobuf-0.1.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
