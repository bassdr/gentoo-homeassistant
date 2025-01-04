# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Python library to communicate with Pinecil V2 soldering irons via Bluetooth"
HOMEPAGE="
  https://pypi.org/project/pynecil/
  Documentation, https://tr4nt0r.github.io/pynecil/
  Source, https://github.com/tr4nt0r/pynecil
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

distutils_enable_tests pytest

# Requires could not be inserted in this ebuild
# Content: bleak

# RDEPEND could not be inserted in this ebuild
# Content: 