# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/parso/"
SRC_URI="
	https://github.com/davidhalter/${PN}/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_sphinx docs
distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# py3.10 changed exception messages
	test/test_python_errors.py::test_python_exception_matches
	# With python3.11 this additional file is run by pytest,
	# but it is not actually a test and thus fails
	parso/python/token.py::parso.python.token.PythonTokenTypes
)
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
# extras could not be inserted in this ebuild
