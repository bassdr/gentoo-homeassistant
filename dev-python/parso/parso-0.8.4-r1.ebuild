# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="qa test"
IUSE="${GENERATED_IUSE}"

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

REQUIRES_DIST="
	docopt; extra == 'testing'
	flake8==5.0.4; extra == 'qa'
	mypy==0.971; extra == 'qa'
	pytest; extra == 'testing'
	types-setuptools==67.2.0.1; extra == 'qa'
"
GENERATED_RDEPEND="${RDEPEND}
	qa? ( ~dev-python/flake8-5.0.4[${PYTHON_USEDEP}] )
	qa? ( ~dev-python/mypy-0.971[${PYTHON_USEDEP}] )
	qa? ( ~dev-python/types-setuptools-67.2.0.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_sphinx docs
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/docopt[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

EPYTEST_DESELECT=(
	# py3.10 changed exception messages
	test/test_python_errors.py::test_python_exception_matches
	# With python3.11 this additional file is run by pytest,
	# but it is not actually a test and thus fails
	parso/python/token.py::parso.python.token.PythonTokenTypes
)
