# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="A library to create a command-line program from a function"
HOMEPAGE="
  https://pypi.org/project/autocommand/
  Homepage, https://github.com/Lucretiel/autocommand
  Bug Tracker, https://github.com/Lucretiel/autocommand/issues
"
SRC_URI="
	https://github.com/Lucretiel/autocommand/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"

PATCHES=(
	"${FILESDIR}"/${PN}-2.2.2-setuptools-license.patch
)

distutils_enable_tests pytest
