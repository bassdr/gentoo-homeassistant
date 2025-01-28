# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=locket.py-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/locket/"
SRC_URI="
	https://github.com/mwilliamson/locket.py/archive/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	test? ( dev-python/spur[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest
