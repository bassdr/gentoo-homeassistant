# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="Clean single-source support for Python 3 and 2"
HOMEPAGE="
  https://pypi.org/project/future/
  Source, https://github.com/PythonCharmers/python-future
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND=""
BDEPEND=""

distutils_enable_tests pytest