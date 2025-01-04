# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_PN=${PN/-/.}
MY_P=${MY_PN}-${PV}

DESCRIPTION="A tiny LRU cache implementation and decorator"
HOMEPAGE="
  https://pypi.org/project/repoze.lru/
"
SRC_URI="
	https://github.com/repoze/repoze.lru/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="repoze"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests unittest

python_compile() {
	distutils-r1_python_compile
	find "${BUILD_DIR}" -name '*.pth' -delete || die
}

# PYPI_PN could not be inserted in this ebuild
