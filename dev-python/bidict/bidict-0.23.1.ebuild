# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="The bidirectional mapping library for Python."
HOMEPAGE="
  https://pypi.org/project/bidict/
  Changelog, https://bidict.readthedocs.io/changelog.html
  Documentation, https://bidict.readthedocs.io
  Funding, https://bidict.readthedocs.io/#sponsoring
  Repository, https://github.com/jab/bidict
"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

distutils_enable_tests pytest
