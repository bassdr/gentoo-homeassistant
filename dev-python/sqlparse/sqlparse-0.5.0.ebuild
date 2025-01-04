# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="A non-validating SQL parser."
HOMEPAGE="
  https://pypi.org/project/sqlparse/
  Home, https://github.com/andialbrecht/sqlparse
  Documentation, https://sqlparse.readthedocs.io/
  Release Notes, https://sqlparse.readthedocs.io/en/latest/changes/
  Source, https://github.com/andialbrecht/sqlparse
  Tracker, https://github.com/andialbrecht/sqlparse/issues
"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_sphinx docs/source
distutils_enable_tests pytest
