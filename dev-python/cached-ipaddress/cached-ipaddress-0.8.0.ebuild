# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Cache construction of ipaddress objects"
HOMEPAGE="
  https://pypi.org/project/cached-ipaddress/
  Bug Tracker, https://github.com/bdraco/cached-ipaddress/issues
  Changelog, https://github.com/bdraco/cached-ipaddress/blob/main/CHANGELOG.md
  Repository, https://github.com/bdraco/cached-ipaddress
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

# Requires could not be inserted in this ebuild
# Content: propcache

# RDEPEND could not be inserted in this ebuild
# Content: 
