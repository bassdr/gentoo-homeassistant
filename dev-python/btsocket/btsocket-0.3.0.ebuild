# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Python library for BlueZ Bluetooth Management API"
HOMEPAGE="
  https://pypi.org/project/btsocket/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="dev docs rel test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

distutils_enable_tests pytest
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
