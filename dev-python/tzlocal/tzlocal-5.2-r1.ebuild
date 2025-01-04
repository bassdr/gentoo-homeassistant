# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1

DESCRIPTION="tzinfo object for the local timezone"
HOMEPAGE="
  https://pypi.org/project/tzlocal/
  Source code, https://github.com/regebro/tzlocal
  Changelog, https://github.com/regebro/tzlocal/blob/master/CHANGES.txt
  Issue tracker, https://github.com/regebro/tzlocal/issues
"
# symlinks aren't correctly preserved in sdist, as of 5.0.1
SRC_URI="
	https://github.com/regebro/tzlocal/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

BDEPEND="
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest