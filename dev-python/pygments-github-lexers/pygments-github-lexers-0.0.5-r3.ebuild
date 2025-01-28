# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pygments-github-lexers/"
SRC_URI="
	https://github.com/liluo/${PN}/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	dev-python/pygments[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
"

PATCHES=(
	"${FILESDIR}/pygments-github-lexers-0.0.5-escape-sequences.patch"
)

# no tests
