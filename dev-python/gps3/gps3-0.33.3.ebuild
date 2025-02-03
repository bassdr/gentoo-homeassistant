# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Python 2.7-3.5 clients for gpsd"
HOMEPAGE="
  https://pypi.org/project/gps3/
"
COMMIT="91adcd7073b891b135b2a46d039ce2125cf09a09"
SRC_URI="https://github.com/wadda/${PN}/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="DESCRIPTION.rst"

GENERATED_RDEPEND="${RDEPEND}
	dev-python/gps3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"
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
