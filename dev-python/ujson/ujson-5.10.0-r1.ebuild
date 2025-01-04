# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="Ultra fast JSON encoder and decoder for Python"
HOMEPAGE="
  https://pypi.org/project/ujson/
  Source, https://github.com/ultrajson/ultrajson
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

DEPEND="
	dev-libs/double-conversion:=
"
RDEPEND="
	${DEPEND}
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/pytz[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_configure() {
	export UJSON_BUILD_DC_INCLUDES="${EPREFIX}/usr/include/double-conversion"
	export UJSON_BUILD_DC_LIBS="-ldouble-conversion"
	export UJSON_BUILD_NO_STRIP=1
}
