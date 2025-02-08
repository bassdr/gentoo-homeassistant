# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_PV=${PV/_beta/b}
MY_P=${PN}-${MY_PV}
DESCRIPTION="Universal feed parser, handles RSS 0.9x, RSS 1.0, RSS 2.0, CDF, Atom 0.3, and Atom 1.0 feeds"
HOMEPAGE="
  https://pypi.org/project/feedparser/
"
SRC_URI="
	https://github.com/kurtmckee/feedparser/archive/${MY_PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	sgmllib3k
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/sgmllib3k[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/sgmllib3k[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}/feedparser-6.0.8-fix-py3.10.patch"
)

src_prepare() {
	# broken
	rm \
		tests/illformed/chardet/{big5,euckr,gb2312,windows1255}.xml \
		tests/illformed/undeclared_namespace.xml || die
	distutils-r1_src_prepare
}

python_test() {
	"${EPYTHON}" tests/runtests.py -v || die "Tests failed with ${EPYTHON}"
}
