# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
DESCRIPTION="A library that returns a list of devices currently connected to a BT Home Hub 5"
HOMEPAGE="
  https://pypi.org/project/bthomehub5-devicelist/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

distutils_enable_tests pytest

# Requires could not be inserted in this ebuild
# Content: html-table-parser-python3, requests

# RDEPEND could not be inserted in this ebuild
# Content: 
