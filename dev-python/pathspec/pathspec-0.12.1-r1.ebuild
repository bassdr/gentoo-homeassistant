# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Utility library for gitignore style pattern matching of file paths."
HOMEPAGE="
  https://pypi.org/project/pathspec/
  Documentation, https://python-path-specification.readthedocs.io/en/latest/index.html
  Issue Tracker, https://github.com/cpburnz/python-pathspec/issues
  Source Code, https://github.com/cpburnz/python-pathspec
"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests unittest
