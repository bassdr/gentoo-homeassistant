# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="Backported and Experimental Type Hints for Python 3.8+"
HOMEPAGE="
  https://pypi.org/project/typing-extensions/
  Bug Tracker, https://github.com/python/typing_extensions/issues
  Changes, https://github.com/python/typing_extensions/blob/main/CHANGELOG.md
  Documentation, https://typing-extensions.readthedocs.io/
  Home, https://github.com/python/typing_extensions
  Q & A, https://github.com/python/typing/discussions
  Repository, https://github.com/python/typing_extensions
"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests unittest

python_test() {
	cd src || die
	eunittest
}
