# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-multiversion/"
SRC_URI="
	https://github.com/Holzhaus/sphinx-multiversion/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/sphinx-2.1[${PYTHON_USEDEP}]
"
DEPEND="
	dev-python/sphinx[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
distutils_enable_sphinx docs dev-python/alabaster
# RDEPEND could not be inserted in this ebuild
