# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ipython-genutils/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

# Needed because package provides decorators which use pytest (after patch)
RDEPEND="
	dev-python/pytest[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}/${P}-remove-nose.patch"
)

distutils_enable_tests pytest
