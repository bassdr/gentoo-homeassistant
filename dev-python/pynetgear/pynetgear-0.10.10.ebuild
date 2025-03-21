# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Access Netgear routers using their SOAP API"
HOMEPAGE="
  https://pypi.org/project/pynetgear/
"
SRC_URI="https://github.com/MatMaul/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	requests >=2.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	echo "requests>=2.0" >> requirements.txt || die
	eapply_user
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
