# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.14.0.post4)"
S="${WORKDIR}/${PN}-0.14.0.post4"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/hidapi/"

LICENSE="|| ( BSD GPL-3 )"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_DEPEND="${RDEPEND}
	>=dev-python/setuptools-19.0[${PYTHON_USEDEP}]
"
DEPEND="
	>=dev-libs/hidapi-$(ver_cut 1-3)
"
RDEPEND="${GENERATED_DEPEND}
	${DEPEND}
"
BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	virtual/pkgconfig
"

distutils_enable_tests pytest

python_configure_all() {
	DISTUTILS_ARGS=(
		--with-system-hidapi
	)
}

python_test() {
	epytest tests.py
}
