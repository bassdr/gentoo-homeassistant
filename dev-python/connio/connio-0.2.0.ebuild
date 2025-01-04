# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Concurrency agnostic socket API"
HOMEPAGE="
  https://pypi.org/project/connio/
  Documentation, https://tiagocoutinho.github.io/connio/
  Source, https://github.com/tiagocoutinho/connio/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

distutils_enable_tests pytest

# Requires could not be inserted in this ebuild
# Content: serialio, sockio

# RDEPEND could not be inserted in this ebuild
# Content: 