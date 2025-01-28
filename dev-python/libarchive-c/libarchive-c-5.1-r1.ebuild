# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=python-libarchive-c-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/libarchive-c/"
SRC_URI="
	https://github.com/Changaco/python-libarchive-c/archive/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	app-arch/libarchive
"

distutils_enable_tests pytest
