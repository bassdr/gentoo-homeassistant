# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/kaitaistruct/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
