# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="Extensible memoizing collections and decorators"
HOMEPAGE="
  https://pypi.org/project/cachetools/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest
