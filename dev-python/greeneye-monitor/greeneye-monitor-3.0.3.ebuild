# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Receive data packets from GreenEye Monitor (http://www.brultech.com/greeneye/)"
HOMEPAGE="
  https://pypi.org/project/greeneye-monitor/
"
SRC_URI="https://github.com/jkeljo/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.rst"

REQUIRES_DIST="
	aiohttp
	siobrultech-protocols (==0.5)
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	~dev-python/siobrultech-protocols-0.5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

