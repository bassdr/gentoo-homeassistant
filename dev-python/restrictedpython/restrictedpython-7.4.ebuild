# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1
MY_PV1=${PV/_beta/b}
MY_PV=${MY_PV1/_alpha/a}

DESCRIPTION="RestrictedPython is a defined subset of the Python language which allows to provide a program input into a trusted environment."
HOMEPAGE="
  https://pypi.org/project/RestrictedPython/
  Documentation, https://restrictedpython.readthedocs.io/
  Source, https://github.com/zopefoundation/RestrictedPython
  Tracker, https://github.com/zopefoundation/RestrictedPython/issues
"
SRC_URI="https://github.com/zopefoundation/${PN}/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.gh.tar.gz"
S=${WORKDIR}/${PN}-${MY_PV}

LICENSE="ZPL"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="${PYTHON_DEPS}
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
"
DEPEND="
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)"

PYTHON_MODULES="${PN}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-mock[${PYTHON_USEDEP}]
)"
# RDEPEND could not be inserted in this ebuild
# PYPI_PN could not be inserted in this ebuild
