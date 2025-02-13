# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Python API wrapper for Rocket.Chat"
HOMEPAGE="
  https://pypi.org/project/rocketchat-API/
"
MY_PN=${PN/-/_}
SRC_URI="https://github.com/jadolg/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="${RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
dev-python/requests[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	echo "Workaround" >> README.md || die
	eapply_user
}

distutils_enable_tests pytest
