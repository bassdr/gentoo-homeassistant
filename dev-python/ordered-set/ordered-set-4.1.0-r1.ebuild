# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 7 -- sys-apps/portage dep
EAPI=7

DISTUTILS_USE_PEP517=flit
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="An OrderedSet is a custom MutableSet that remembers its order, so that every"
HOMEPAGE="
  https://pypi.org/project/ordered-set/
  Home, https://github.com/rspeer/ordered-set
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
# extras could not be inserted in this ebuild
