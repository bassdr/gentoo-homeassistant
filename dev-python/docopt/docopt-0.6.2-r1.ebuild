# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1

DESCRIPTION="Pythonic argument parser, that will make you smile"
HOMEPAGE="
  https://pypi.org/project/docopt/
"
SRC_URI="
	https://github.com/docopt/docopt/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

PATCHES=(
	"${FILESDIR}"/${PN}-0.6.2-pytest_node_from_parent.patch
)

distutils_enable_tests pytest
