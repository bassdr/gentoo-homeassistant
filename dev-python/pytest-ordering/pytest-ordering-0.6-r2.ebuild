# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-ordering/"
SRC_URI="
	https://github.com/ftobia/pytest-ordering/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/pytest[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/pytest[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}/${P}-fix-pytest-6.patch"
	"${FILESDIR}/${P}-marks.patch"
)

distutils_enable_tests pytest
distutils_enable_sphinx docs/source
