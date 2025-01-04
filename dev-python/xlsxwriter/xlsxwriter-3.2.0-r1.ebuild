# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1

TAG=RELEASE_${PV}
MY_P=XlsxWriter-${TAG}
DESCRIPTION="A Python module for creating Excel XLSX files."
HOMEPAGE="
  https://pypi.org/project/XlsxWriter/
"
SRC_URI="
	https://github.com/jmcnamara/XlsxWriter/archive/${TAG}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}

# PYPI_PN could not be inserted in this ebuild
# Content: 