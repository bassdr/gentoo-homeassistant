# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Nobø Hub / Nobø Energy Control TCP/IP Interface"
HOMEPAGE="
  https://pypi.org/project/pynobo/
  Bug Reports, https://github.com/echoromeo/pynobo/issues
  Source, https://github.com/echoromeo/pynobo/blob/master/pynobo.py
"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

distutils_enable_tests pytest
