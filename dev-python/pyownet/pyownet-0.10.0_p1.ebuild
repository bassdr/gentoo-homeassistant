# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.10.0.post1)"
S="${WORKDIR}/$(pypi_normalize_name ${PN})-0.10.0.post1"

DESCRIPTION="Python OWFS client library (owserver protocol)"
HOMEPAGE="
  https://pypi.org/project/pyownet/
"
MY_PV=${PV/_p/.post}

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

PATCHES=( "${FILESDIR}/pyownet-${PV}-2to3.patch" )

distutils_enable_tests pytest
