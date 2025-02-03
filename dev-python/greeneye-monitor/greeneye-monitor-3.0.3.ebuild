# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Receive data packets from GreenEye Monitor (http://www.brultech.com/greeneye/)"
HOMEPAGE="
  https://pypi.org/project/greeneye_monitor/
"
SRC_URI="https://github.com/jkeljo/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	=dev-python/siobrultech-protocols-0.5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	~dev-python/siobrultech-protocols-0.5.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	app-arch/unzip
"
BDEPEND="${GENERATED_BDEPEND}"

