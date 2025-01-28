# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_PV=${PV}
MY_P=et_xmlfile-${MY_PV}

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/et-xmlfile/"
SRC_URI="
	https://foss.heptapod.net/openpyxl/et_xmlfile/-/archive/${MY_PV}/${MY_P}.tar.gz
		-> ${MY_P}.git.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	dev-python/lxml[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
distutils_enable_sphinx doc \
	dev-python/sphinx-rtd-theme
