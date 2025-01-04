# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Cryptographic library for Python"
HOMEPAGE="
  https://pypi.org/project/pycryptodomex/
  Source, https://github.com/Legrandin/pycryptodome/
  Changelog, https://www.pycryptodome.org/src/changelog
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

distutils_enable_tests pytest
