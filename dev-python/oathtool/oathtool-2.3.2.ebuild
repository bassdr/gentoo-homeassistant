# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="One-time password generator"
HOMEPAGE="
  https://pypi.org/project/oathtool/
  Source, https://github.com/jaraco/oathtool
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

distutils_enable_tests pytest

# Requires could not be inserted in this ebuild
# Content: autocommand, path

# RDEPEND could not be inserted in this ebuild
# Content: 