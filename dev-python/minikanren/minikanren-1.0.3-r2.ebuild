# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=kanren-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/miniKanren/"
SRC_URI="
	https://github.com/pythological/kanren/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	dev-python/cons[${PYTHON_USEDEP}]
	dev-python/etuples[${PYTHON_USEDEP}]
	dev-python/logical-unification[${PYTHON_USEDEP}]
	dev-python/multipledispatch[${PYTHON_USEDEP}]
	dev-python/toolz[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
# PYPI_PN could not be inserted in this ebuild
